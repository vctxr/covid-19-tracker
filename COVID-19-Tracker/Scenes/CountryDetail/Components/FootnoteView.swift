//
//  FootnoteView.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 30/04/22.
//

import SwiftUI

struct FootnoteView: View {
    // MARK: - Body 🎨
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("PLEASE NOTE:")
                .font(.system(size: 9, weight: .bold))
            
            Text("The datasets shown here were fetched from a JSON file made by github user pomber, which were provided by John Hopkins University Center for Systems Science and Engineering (JHU CSSE).")
                .font(.system(size: 9))
                .layoutPriority(1)
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .foregroundColor(.white)
        .background(Color.grey900Color)
    }
}

// MARK: - Previews 📷

struct FootnoteView_Previews: PreviewProvider {
    private static var groupPreviews: some View {
        Group {
            FootnoteView()
        }
        .previewLayout(.sizeThatFits)
    }

    static var previews: some View {
        groupPreviews
            .preferredColorScheme(.light)
        groupPreviews
            .preferredColorScheme(.dark)
    }
}
