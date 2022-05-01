//
//  CovidTimelineProvider.swift
//  COVID-19-TrackerWidget
//
//  Created by Victor Samuel Cuaca on 01/05/22.
//

import WidgetKit
import Networking

struct CovidTimelineProvider: TimelineProvider {
    private let networkService = NetworkingService()
    
    func placeholder(in context: Context) -> CovidEntry {
        .placeholder
    }

    func getSnapshot(in context: Context, completion: @escaping (CovidEntry) -> ()) {
        fetchTimeseriesEntry { result in
            switch result {
            case .success(let entry):
                completion(entry)
            case .failure:
                completion(.placeholder)
            }
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<CovidEntry>) -> ()) {
        fetchTimeseriesEntry { result in
            switch result {
            case .success(let entry):
                let tomorrow = Calendar.current.date(byAdding: DateComponents(day: 1), to: Date())!
                let tomorrowMidnight = Calendar.current.startOfDay(for: tomorrow)
                let timeline = Timeline(entries: [entry], policy: .after(tomorrowMidnight))
                completion(timeline)
            case .failure:
                let twoMinutes = Calendar.current.date(byAdding: .minute, value: 2, to: Date())!
                let timeline = Timeline(entries: [CovidEntry.placeholder], policy: .after(twoMinutes))
                completion(timeline)
            }
        }
    }
    
    private func fetchTimeseriesEntry(completion: @escaping (Result<CovidEntry, NetworkError>) -> Void) {
        let publisher = networkService.request(with: CountryListEndpoint.covidTimeseries.urlRequest)
            .map(\CovidTimeseriesResponse.countries)
            .eraseToAnyPublisher()
        
        Task {
            do {
                let timeseriesData = try await publisher.async()
                let entry = CovidEntry(date: Date(), timeseriesData: timeseriesData)
                completion(.success(entry))
            } catch {
                completion(.failure(NetworkError(error: error)))
            }
        }
    }
}
