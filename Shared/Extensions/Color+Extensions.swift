//
//  Color+Extensions.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 24/04/22.
//

import SwiftUI

extension Color {
    init(rgb: UInt, opacity: CGFloat) {
        self.init(
            .sRGB,
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            opacity: opacity
        )
    }
    
    init(rgb: UInt) {
        self.init(rgb: rgb, opacity: 1.0)
    }
    
    init(
        light lightModeColor: @escaping @autoclosure () -> Color,
        dark darkModeColor: @escaping @autoclosure () -> Color
    ) {
        self.init(UIColor(light: UIColor(lightModeColor()), dark: UIColor(darkModeColor())))
    }
}

// MARK: - Color Tokens

extension Color {
    // MARK: - System
    
    static var systemBackground: Color {
        Color(uiColor: .systemBackground)
    }

    // MARK: - Red
    
    static var red50Color: Color {
        Color(rgb: 0xffebee)
    }

    static var red100Color: Color {
        Color(rgb: 0xffcdd2)
    }

    static var red200Color: Color {
        Color(rgb: 0xef9a9a)
    }

    static var red300Color: Color {
        Color(rgb: 0xe57373)
    }

    static var red400Color: Color {
        Color(rgb: 0xef5350)
    }

    static var red500Color: Color {
        Color(rgb: 0xf44336)
    }

    static var red600Color: Color {
        Color(rgb: 0xe53935)
    }

    static var red700Color: Color {
        Color(rgb: 0xd32f2f)
    }

    static var red800Color: Color {
        Color(rgb: 0xc62828)
    }

    static var red900Color: Color {
        Color(rgb: 0xb71c1c)
    }

    static var redA100Color: Color {
        Color(rgb: 0xff8a80)
    }

    static var redA200Color: Color {
        Color(rgb: 0xff5252)
    }

    static var redA400Color: Color {
        Color(rgb: 0xff1744)
    }

    static var redA700Color: Color {
        Color(rgb: 0xd50000)
    }

    // MARK: - Pink
    
    static var pink50Color: Color {
        Color(rgb: 0xfce4ec)
    }

    static var pink100Color: Color {
        Color(rgb: 0xf8bbd0)
    }

    static var pink200Color: Color {
        Color(rgb: 0xf48fb1)
    }

    static var pink300Color: Color {
        Color(rgb: 0xf06292)
    }

    static var pink400Color: Color {
        Color(rgb: 0xec407a)
    }

    static var pink500Color: Color {
        Color(rgb: 0xe91e63)
    }

    static var pink600Color: Color {
        Color(rgb: 0xd81b60)
    }

    static var pink700Color: Color {
        Color(rgb: 0xc2185b)
    }

    static var pink800Color: Color {
        Color(rgb: 0xad1457)
    }

    static var pink900Color: Color {
        Color(rgb: 0x880e4f)
    }

    static var pinkA100Color: Color {
        Color(rgb: 0xff80ab)
    }

    static var pinkA200Color: Color {
        Color(rgb: 0xff4081)
    }

    static var pinkA400Color: Color {
        Color(rgb: 0xf50057)
    }

    static var pinkA700Color: Color {
        Color(rgb: 0xc51162)
    }

    // MARK: - Purple
    
    static var purple50Color: Color {
        Color(rgb: 0xf3e5f5)
    }

    static var purple100Color: Color {
        Color(rgb: 0xe1bee7)
    }

    static var purple200Color: Color {
        Color(rgb: 0xce93d8)
    }

    static var purple300Color: Color {
        Color(rgb: 0xba68c8)
    }

    static var purple400Color: Color {
        Color(rgb: 0xab47bc)
    }

    static var purple500Color: Color {
        Color(rgb: 0x9c27b0)
    }

    static var purple600Color: Color {
        Color(rgb: 0x8e24aa)
    }

    static var purple700Color: Color {
        Color(rgb: 0x7b1fa2)
    }

    static var purple800Color: Color {
        Color(rgb: 0x6a1b9a)
    }

    static var purple900Color: Color {
        Color(rgb: 0x4a148c)
    }

    static var purpleA100Color: Color {
        Color(rgb: 0xea80fc)
    }

    static var purpleA200Color: Color {
        Color(rgb: 0xe040fb)
    }

    static var purpleA400Color: Color {
        Color(rgb: 0xd500f9)
    }

    static var purpleA700Color: Color {
        Color(rgb: 0xaa00ff)
    }

    // MARK: - Deep-purple
    
    static var deepPurple50Color: Color {
        Color(rgb: 0xede7f6)
    }

    static var deepPurple100Color: Color {
        Color(rgb: 0xd1c4e9)
    }

    static var deepPurple200Color: Color {
        Color(rgb: 0xb39ddb)
    }

    static var deepPurple300Color: Color {
        Color(rgb: 0x9575cd)
    }

    static var deepPurple400Color: Color {
        Color(rgb: 0x7e57c2)
    }

    static var deepPurple500Color: Color {
        Color(rgb: 0x673ab7)
    }

    static var deepPurple600Color: Color {
        Color(rgb: 0x5e35b1)
    }

    static var deepPurple700Color: Color {
        Color(rgb: 0x512da8)
    }

    static var deepPurple800Color: Color {
        Color(rgb: 0x4527a0)
    }

    static var deepPurple900Color: Color {
        Color(rgb: 0x311b92)
    }

    static var deepPurpleA100Color: Color {
        Color(rgb: 0xb388ff)
    }

    static var deepPurpleA200Color: Color {
        Color(rgb: 0x7c4dff)
    }

    static var deepPurpleA400Color: Color {
        Color(rgb: 0x651fff)
    }

    static var deepPurpleA700Color: Color {
        Color(rgb: 0x6200ea)
    }

    // MARK: - Indigo
    
    static var indigo50Color: Color {
        Color(rgb: 0xe8eaf6)
    }

    static var indigo100Color: Color {
        Color(rgb: 0xc5cae9)
    }

    static var indigo200Color: Color {
        Color(rgb: 0x9fa8da)
    }

    static var indigo300Color: Color {
        Color(rgb: 0x7986cb)
    }

    static var indigo400Color: Color {
        Color(rgb: 0x5c6bc0)
    }

    static var indigo500Color: Color {
        Color(rgb: 0x3f51b5)
    }

    static var indigo600Color: Color {
        Color(rgb: 0x3949ab)
    }

    static var indigo700Color: Color {
        Color(rgb: 0x303f9f)
    }

    static var indigo800Color: Color {
        Color(rgb: 0x283593)
    }

    static var indigo900Color: Color {
        Color(rgb: 0x1a237e)
    }

    static var indigoA100Color: Color {
        Color(rgb: 0x8c9eff)
    }

    static var indigoA200Color: Color {
        Color(rgb: 0x536dfe)
    }

    static var indigoA400Color: Color {
        Color(rgb: 0x3d5afe)
    }

    static var indigoA700Color: Color {
        Color(rgb: 0x304ffe)
    }

    // MARK: - Blue
    
    static var blue50Color: Color {
        Color(rgb: 0xe3f2fd)
    }

    static var blue100Color: Color {
        Color(rgb: 0xbbdefb)
    }

    static var blue200Color: Color {
        Color(rgb: 0x90caf9)
    }

    static var blue300Color: Color {
        Color(rgb: 0x64b5f6)
    }

    static var blue400Color: Color {
        Color(rgb: 0x42a5f5)
    }

    static var blue500Color: Color {
        Color(rgb: 0x2196f3)
    }

    static var blue600Color: Color {
        Color(rgb: 0x1e88e5)
    }

    static var blue700Color: Color {
        Color(rgb: 0x1976d2)
    }

    static var blue800Color: Color {
        Color(rgb: 0x1565c0)
    }

    static var blue900Color: Color {
        Color(rgb: 0x0d47a1)
    }

    static var blueA100Color: Color {
        Color(rgb: 0x82b1ff)
    }

    static var blueA200Color: Color {
        Color(rgb: 0x448aff)
    }

    static var blueA400Color: Color {
        Color(rgb: 0x2979ff)
    }

    static var blueA700Color: Color {
        Color(rgb: 0x2962ff)
    }

    // MARK: - Light-blue
    
    static var lightBlue50Color: Color {
        Color(rgb: 0xe1f5fe)
    }

    static var lightBlue100Color: Color {
        Color(rgb: 0xb3e5fc)
    }

    static var lightBlue200Color: Color {
        Color(rgb: 0x81d4fa)
    }

    static var lightBlue300Color: Color {
        Color(rgb: 0x4fc3f7)
    }

    static var lightBlue400Color: Color {
        Color(rgb: 0x29b6f6)
    }

    static var lightBlue500Color: Color {
        Color(rgb: 0x03a9f4)
    }

    static var lightBlue600Color: Color {
        Color(rgb: 0x039be5)
    }

    static var lightBlue700Color: Color {
        Color(rgb: 0x0288d1)
    }

    static var lightBlue800Color: Color {
        Color(rgb: 0x0277bd)
    }

    static var lightBlue900Color: Color {
        Color(rgb: 0x01579b)
    }

    static var lightBlueA100Color: Color {
        Color(rgb: 0x80d8ff)
    }

    static var lightBlueA200Color: Color {
        Color(rgb: 0x40c4ff)
    }

    static var lightBlueA400Color: Color {
        Color(rgb: 0x00b0ff)
    }

    static var lightBlueA700Color: Color {
        Color(rgb: 0x0091ea)
    }

    // MARK: - Cyan
    
    static var cyan50Color: Color {
        Color(rgb: 0xe0f7fa)
    }

    static var cyan100Color: Color {
        Color(rgb: 0xb2ebf2)
    }

    static var cyan200Color: Color {
        Color(rgb: 0x80deea)
    }

    static var cyan300Color: Color {
        Color(rgb: 0x4dd0e1)
    }

    static var cyan400Color: Color {
        Color(rgb: 0x26c6da)
    }

    static var cyan500Color: Color {
        Color(rgb: 0x00bcd4)
    }

    static var cyan600Color: Color {
        Color(rgb: 0x00acc1)
    }

    static var cyan700Color: Color {
        Color(rgb: 0x0097a7)
    }

    static var cyan800Color: Color {
        Color(rgb: 0x00838f)
    }

    static var cyan900Color: Color {
        Color(rgb: 0x006064)
    }

    static var cyanA100Color: Color {
        Color(rgb: 0x84ffff)
    }

    static var cyanA200Color: Color {
        Color(rgb: 0x18ffff)
    }

    static var cyanA400Color: Color {
        Color(rgb: 0x00e5ff)
    }

    static var cyanA700Color: Color {
        Color(rgb: 0x00b8d4)
    }

    // MARK: - Teal
    
    static var teal50Color: Color {
        Color(rgb: 0xe0f2f1)
    }

    static var teal100Color: Color {
        Color(rgb: 0xb2dfdb)
    }

    static var teal200Color: Color {
        Color(rgb: 0x80cbc4)
    }

    static var teal300Color: Color {
        Color(rgb: 0x4db6ac)
    }

    static var teal400Color: Color {
        Color(rgb: 0x26a69a)
    }

    static var teal500Color: Color {
        Color(rgb: 0x009688)
    }

    static var teal600Color: Color {
        Color(rgb: 0x00897b)
    }

    static var teal700Color: Color {
        Color(rgb: 0x00796b)
    }

    static var teal800Color: Color {
        Color(rgb: 0x00695c)
    }

    static var teal900Color: Color {
        Color(rgb: 0x004d40)
    }

    static var tealA100Color: Color {
        Color(rgb: 0xa7ffeb)
    }

    static var tealA200Color: Color {
        Color(rgb: 0x64ffda)
    }

    static var tealA400Color: Color {
        Color(rgb: 0x1de9b6)
    }

    static var tealA700Color: Color {
        Color(rgb: 0x00bfa5)
    }

    // MARK: - Green
    
    static var green50Color: Color {
        Color(rgb: 0xe8f5e9)
    }

    static var green100Color: Color {
        Color(rgb: 0xc8e6c9)
    }

    static var green200Color: Color {
        Color(rgb: 0xa5d6a7)
    }

    static var green300Color: Color {
        Color(rgb: 0x81c784)
    }

    static var green400Color: Color {
        Color(rgb: 0x66bb6a)
    }

    static var green500Color: Color {
        Color(rgb: 0x4caf50)
    }

    static var green600Color: Color {
        Color(rgb: 0x43a047)
    }

    static var green700Color: Color {
        Color(rgb: 0x388e3c)
    }

    static var green800Color: Color {
        Color(rgb: 0x2e7d32)
    }

    static var green900Color: Color {
        Color(rgb: 0x1b5e20)
    }

    static var greenA100Color: Color {
        Color(rgb: 0xb9f6ca)
    }

    static var greenA200Color: Color {
        Color(rgb: 0x69f0ae)
    }

    static var greenA400Color: Color {
        Color(rgb: 0x00e676)
    }

    static var greenA700Color: Color {
        Color(rgb: 0x00c853)
    }

    // MARK: - Light-green
    
    static var lightGreen50Color: Color {
        Color(rgb: 0xf1f8e9)
    }

    static var lightGreen100Color: Color {
        Color(rgb: 0xdcedc8)
    }

    static var lightGreen200Color: Color {
        Color(rgb: 0xc5e1a5)
    }

    static var lightGreen300Color: Color {
        Color(rgb: 0xaed581)
    }

    static var lightGreen400Color: Color {
        Color(rgb: 0x9ccc65)
    }

    static var lightGreen500Color: Color {
        Color(rgb: 0x8bc34a)
    }

    static var lightGreen600Color: Color {
        Color(rgb: 0x7cb342)
    }

    static var lightGreen700Color: Color {
        Color(rgb: 0x689f38)
    }

    static var lightGreen800Color: Color {
        Color(rgb: 0x558b2f)
    }

    static var lightGreen900Color: Color {
        Color(rgb: 0x33691e)
    }

    static var lightGreenA100Color: Color {
        Color(rgb: 0xccff90)
    }

    static var lightGreenA200Color: Color {
        Color(rgb: 0xb2ff59)
    }

    static var lightGreenA400Color: Color {
        Color(rgb: 0x76ff03)
    }

    static var lightGreenA700Color: Color {
        Color(rgb: 0x64dd17)
    }

    // MARK: - Lime
    
    static var lime50Color: Color {
        Color(rgb: 0xf9fbe7)
    }

    static var lime100Color: Color {
        Color(rgb: 0xf0f4c3)
    }

    static var lime200Color: Color {
        Color(rgb: 0xe6ee9c)
    }

    static var lime300Color: Color {
        Color(rgb: 0xdce775)
    }

    static var lime400Color: Color {
        Color(rgb: 0xd4e157)
    }

    static var lime500Color: Color {
        Color(rgb: 0xcddc39)
    }

    static var lime600Color: Color {
        Color(rgb: 0xc0ca33)
    }

    static var lime700Color: Color {
        Color(rgb: 0xafb42b)
    }

    static var lime800Color: Color {
        Color(rgb: 0x9e9d24)
    }

    static var lime900Color: Color {
        Color(rgb: 0x827717)
    }

    static var limeA100Color: Color {
        Color(rgb: 0xf4ff81)
    }

    static var limeA200Color: Color {
        Color(rgb: 0xeeff41)
    }

    static var limeA400Color: Color {
        Color(rgb: 0xc6ff00)
    }

    static var limeA700Color: Color {
        Color(rgb: 0xaeea00)
    }

    // MARK: - Yellow
    
    static var yellow50Color: Color {
        Color(rgb: 0xfffde7)
    }

    static var yellow100Color: Color {
        Color(rgb: 0xfff9c4)
    }

    static var yellow200Color: Color {
        Color(rgb: 0xfff59d)
    }

    static var yellow300Color: Color {
        Color(rgb: 0xfff176)
    }

    static var yellow400Color: Color {
        Color(rgb: 0xffee58)
    }

    static var yellow500Color: Color {
        Color(rgb: 0xffeb3b)
    }

    static var yellow600Color: Color {
        Color(rgb: 0xfdd835)
    }

    static var yellow700Color: Color {
        Color(rgb: 0xfbc02d)
    }

    static var yellow800Color: Color {
        Color(rgb: 0xf9a825)
    }

    static var yellow900Color: Color {
        Color(rgb: 0xf57f17)
    }

    static var yellowA100Color: Color {
        Color(rgb: 0xffff8d)
    }

    static var yellowA200Color: Color {
        Color(rgb: 0xffff00)
    }

    static var yellowA400Color: Color {
        Color(rgb: 0xffea00)
    }

    static var yellowA700Color: Color {
        Color(rgb: 0xffd600)
    }

    // MARK: - Amber
    
    static var amber50Color: Color {
        Color(rgb: 0xfff8e1)
    }

    static var amber100Color: Color {
        Color(rgb: 0xffecb3)
    }

    static var amber200Color: Color {
        Color(rgb: 0xffe082)
    }

    static var amber300Color: Color {
        Color(rgb: 0xffd54f)
    }

    static var amber400Color: Color {
        Color(rgb: 0xffca28)
    }

    static var amber500Color: Color {
        Color(rgb: 0xffc107)
    }

    static var amber600Color: Color {
        Color(rgb: 0xffb300)
    }

    static var amber700Color: Color {
        Color(rgb: 0xffa000)
    }

    static var amber800Color: Color {
        Color(rgb: 0xff8f00)
    }

    static var amber900Color: Color {
        Color(rgb: 0xff6f00)
    }

    static var amberA100Color: Color {
        Color(rgb: 0xffe57f)
    }

    static var amberA200Color: Color {
        Color(rgb: 0xffd740)
    }

    static var amberA400Color: Color {
        Color(rgb: 0xffc400)
    }

    static var amberA700Color: Color {
        Color(rgb: 0xffab00)
    }

    // MARK: - Orange
    
    static var orange50Color: Color {
        Color(rgb: 0xfff3e0)
    }

    static var orange100Color: Color {
        Color(rgb: 0xffe0b2)
    }

    static var orange200Color: Color {
        Color(rgb: 0xffcc80)
    }

    static var orange300Color: Color {
        Color(rgb: 0xffb74d)
    }

    static var orange400Color: Color {
        Color(rgb: 0xffa726)
    }

    static var orange500Color: Color {
        Color(rgb: 0xff9800)
    }

    static var orange600Color: Color {
        Color(rgb: 0xfb8c00)
    }

    static var orange700Color: Color {
        Color(rgb: 0xf57c00)
    }

    static var orange800Color: Color {
        Color(rgb: 0xef6c00)
    }

    static var orange900Color: Color {
        Color(rgb: 0xe65100)
    }

    static var orangeA100Color: Color {
        Color(rgb: 0xffd180)
    }

    static var orangeA200Color: Color {
        Color(rgb: 0xffab40)
    }

    static var orangeA400Color: Color {
        Color(rgb: 0xff9100)
    }

    static var orangeA700Color: Color {
        Color(rgb: 0xff6d00)
    }

    // MARK: - Deep-orange
    
    static var deepOrange50Color: Color {
        Color(rgb: 0xfbe9e7)
    }

    static var deepOrange100Color: Color {
        Color(rgb: 0xffccbc)
    }

    static var deepOrange200Color: Color {
        Color(rgb: 0xffab91)
    }

    static var deepOrange300Color: Color {
        Color(rgb: 0xff8a65)
    }

    static var deepOrange400Color: Color {
        Color(rgb: 0xff7043)
    }

    static var deepOrange500Color: Color {
        Color(rgb: 0xff5722)
    }

    static var deepOrange600Color: Color {
        Color(rgb: 0xf4511e)
    }

    static var deepOrange700Color: Color {
        Color(rgb: 0xe64a19)
    }

    static var deepOrange800Color: Color {
        Color(rgb: 0xd84315)
    }

    static var deepOrange900Color: Color {
        Color(rgb: 0xbf360c)
    }

    static var deepOrangeA100Color: Color {
        Color(rgb: 0xff9e80)
    }

    static var deepOrangeA200Color: Color {
        Color(rgb: 0xff6e40)
    }

    static var deepOrangeA400Color: Color {
        Color(rgb: 0xff3d00)
    }

    static var deepOrangeA700Color: Color {
        Color(rgb: 0xdd2c00)
    }

    // MARK: - Brown
    
    static var brown50Color: Color {
        Color(rgb: 0xefebe9)
    }

    static var brown100Color: Color {
        Color(rgb: 0xd7ccc8)
    }

    static var brown200Color: Color {
        Color(rgb: 0xbcaaa4)
    }

    static var brown300Color: Color {
        Color(rgb: 0xa1887f)
    }

    static var brown400Color: Color {
        Color(rgb: 0x8d6e63)
    }

    static var brown500Color: Color {
        Color(rgb: 0x795548)
    }

    static var brown600Color: Color {
        Color(rgb: 0x6d4c41)
    }

    static var brown700Color: Color {
        Color(rgb: 0x5d4037)
    }

    static var brown800Color: Color {
        Color(rgb: 0x4e342e)
    }

    static var brown900Color: Color {
        Color(rgb: 0x3e2723)
    }

    // MARK: - Grey
    
    static var grey50Color: Color {
        Color(rgb: 0xfafafa)
    }

    static var grey100Color: Color {
        Color(rgb: 0xf5f5f5)
    }

    static var grey200Color: Color {
        Color(rgb: 0xeeeeee)
    }

    static var grey300Color: Color {
        Color(rgb: 0xe0e0e0)
    }

    static var grey400Color: Color {
        Color(rgb: 0xbdbdbd)
    }

    static var grey500Color: Color {
        Color(rgb: 0x9e9e9e)
    }

    static var grey600Color: Color {
        Color(rgb: 0x757575)
    }

    static var grey700Color: Color {
        Color(rgb: 0x616161)
    }

    static var grey800Color: Color {
        Color(rgb: 0x424242)
    }

    static var grey900Color: Color {
        Color(rgb: 0x212121)
    }

    // MARK: - Blue-grey
    
    static var blueGrey50Color: Color {
        Color(rgb: 0xeceff1)
    }

    static var blueGrey100Color: Color {
        Color(rgb: 0xcfd8dc)
    }

    static var blueGrey200Color: Color {
        Color(rgb: 0xb0bec5)
    }

    static var blueGrey300Color: Color {
        Color(rgb: 0x90a4ae)
    }

    static var blueGrey400Color: Color {
        Color(rgb: 0x78909c)
    }

    static var blueGrey500Color: Color {
        Color(rgb: 0x607d8b)
    }

    static var blueGrey600Color: Color {
        Color(rgb: 0x546e7a)
    }

    static var blueGrey700Color: Color {
        Color(rgb: 0x455a64)
    }

    static var blueGrey800Color: Color {
        Color(rgb: 0x37474f)
    }

    static var blueGrey900Color: Color {
        Color(rgb: 0x263238)
    }
}

// MARK: - Palettes

extension Color {
    static var primaryRed: Color {
        Color(light: .red800Color, dark: .red800Color.opacity(0.95))
    }
    
    static var primaryOrange: Color {
        Color(light: .orange700Color, dark: .orange700Color.opacity(0.95))
    }

    static var primaryYellow: Color {
        Color(light: .yellow800Color, dark: .yellow800Color.opacity(0.95))
    }
    
    static var primaryBlue: Color {
        Color(light: .blue600Color, dark: .blue800Color)
    }
    
    static var redText: Color {
        Color(light: .red900Color, dark: .red800Color)
    }
    
    static var orangeText: Color {
        Color(light: .orange700Color, dark: .orange800Color)
    }
    
    static var secondaryText: Color {
        Color(uiColor: .secondaryLabel)
    }
}

// MARK: - Gradients

extension Array where Element == Color {
    static var gradientPurple: [Color] {
        [
            Color(rgb: 0xf06744),
            Color(rgb: 0xee4c53),
            Color(rgb: 0xd35e94),
            Color(rgb: 0x9c6ca5),
            Color(rgb: 0x6782be)
        ]
    }
    
    static var gradientOrange: [Color] {
        [
            Color(light: Color(rgb: 0xd14545), dark: Color(rgb: 0xfc575e)),
            Color(light: Color(rgb: 0xff4e00), dark: Color(rgb: 0xff9933))
        ]
    }
}
