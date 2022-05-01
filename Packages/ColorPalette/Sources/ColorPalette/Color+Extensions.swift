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
    
    public static var systemBackground: Color {
        Color(uiColor: .systemBackground)
    }

    // MARK: - Red
    
    public static var red50Color: Color {
        Color(rgb: 0xffebee)
    }

    public static var red100Color: Color {
        Color(rgb: 0xffcdd2)
    }

    public static var red200Color: Color {
        Color(rgb: 0xef9a9a)
    }

    public static var red300Color: Color {
        Color(rgb: 0xe57373)
    }

    public static var red400Color: Color {
        Color(rgb: 0xef5350)
    }

    public static var red500Color: Color {
        Color(rgb: 0xf44336)
    }

    public static var red600Color: Color {
        Color(rgb: 0xe53935)
    }

    public static var red700Color: Color {
        Color(rgb: 0xd32f2f)
    }

    public static var red800Color: Color {
        Color(rgb: 0xc62828)
    }

    public static var red900Color: Color {
        Color(rgb: 0xb71c1c)
    }

    public static var redA100Color: Color {
        Color(rgb: 0xff8a80)
    }

    public static var redA200Color: Color {
        Color(rgb: 0xff5252)
    }

    public static var redA400Color: Color {
        Color(rgb: 0xff1744)
    }

    public static var redA700Color: Color {
        Color(rgb: 0xd50000)
    }

    // MARK: - Pink
    
    public static var pink50Color: Color {
        Color(rgb: 0xfce4ec)
    }

    public static var pink100Color: Color {
        Color(rgb: 0xf8bbd0)
    }

    public static var pink200Color: Color {
        Color(rgb: 0xf48fb1)
    }

    public static var pink300Color: Color {
        Color(rgb: 0xf06292)
    }

    public static var pink400Color: Color {
        Color(rgb: 0xec407a)
    }

    public static var pink500Color: Color {
        Color(rgb: 0xe91e63)
    }

    public static var pink600Color: Color {
        Color(rgb: 0xd81b60)
    }

    public static var pink700Color: Color {
        Color(rgb: 0xc2185b)
    }

    public static var pink800Color: Color {
        Color(rgb: 0xad1457)
    }

    public static var pink900Color: Color {
        Color(rgb: 0x880e4f)
    }

    public static var pinkA100Color: Color {
        Color(rgb: 0xff80ab)
    }

    public static var pinkA200Color: Color {
        Color(rgb: 0xff4081)
    }

    public static var pinkA400Color: Color {
        Color(rgb: 0xf50057)
    }

    public static var pinkA700Color: Color {
        Color(rgb: 0xc51162)
    }

    // MARK: - Purple
    
    public static var purple50Color: Color {
        Color(rgb: 0xf3e5f5)
    }

    public static var purple100Color: Color {
        Color(rgb: 0xe1bee7)
    }

    public static var purple200Color: Color {
        Color(rgb: 0xce93d8)
    }

    public static var purple300Color: Color {
        Color(rgb: 0xba68c8)
    }

    public static var purple400Color: Color {
        Color(rgb: 0xab47bc)
    }

    public static var purple500Color: Color {
        Color(rgb: 0x9c27b0)
    }

    public static var purple600Color: Color {
        Color(rgb: 0x8e24aa)
    }

    public static var purple700Color: Color {
        Color(rgb: 0x7b1fa2)
    }

    public static var purple800Color: Color {
        Color(rgb: 0x6a1b9a)
    }

    public static var purple900Color: Color {
        Color(rgb: 0x4a148c)
    }

    public static var purpleA100Color: Color {
        Color(rgb: 0xea80fc)
    }

    public static var purpleA200Color: Color {
        Color(rgb: 0xe040fb)
    }

    public static var purpleA400Color: Color {
        Color(rgb: 0xd500f9)
    }

    public static var purpleA700Color: Color {
        Color(rgb: 0xaa00ff)
    }

    // MARK: - Deep-purple
    
    public static var deepPurple50Color: Color {
        Color(rgb: 0xede7f6)
    }

    public static var deepPurple100Color: Color {
        Color(rgb: 0xd1c4e9)
    }

    public static var deepPurple200Color: Color {
        Color(rgb: 0xb39ddb)
    }

    public static var deepPurple300Color: Color {
        Color(rgb: 0x9575cd)
    }

    public static var deepPurple400Color: Color {
        Color(rgb: 0x7e57c2)
    }

    public static var deepPurple500Color: Color {
        Color(rgb: 0x673ab7)
    }

    public static var deepPurple600Color: Color {
        Color(rgb: 0x5e35b1)
    }

    public static var deepPurple700Color: Color {
        Color(rgb: 0x512da8)
    }

    public static var deepPurple800Color: Color {
        Color(rgb: 0x4527a0)
    }

    public static var deepPurple900Color: Color {
        Color(rgb: 0x311b92)
    }

    public static var deepPurpleA100Color: Color {
        Color(rgb: 0xb388ff)
    }

    public static var deepPurpleA200Color: Color {
        Color(rgb: 0x7c4dff)
    }

    public static var deepPurpleA400Color: Color {
        Color(rgb: 0x651fff)
    }

    public static var deepPurpleA700Color: Color {
        Color(rgb: 0x6200ea)
    }

    // MARK: - Indigo
    
    public static var indigo50Color: Color {
        Color(rgb: 0xe8eaf6)
    }

    public static var indigo100Color: Color {
        Color(rgb: 0xc5cae9)
    }

    public static var indigo200Color: Color {
        Color(rgb: 0x9fa8da)
    }

    public static var indigo300Color: Color {
        Color(rgb: 0x7986cb)
    }

    public static var indigo400Color: Color {
        Color(rgb: 0x5c6bc0)
    }

    public static var indigo500Color: Color {
        Color(rgb: 0x3f51b5)
    }

    public static var indigo600Color: Color {
        Color(rgb: 0x3949ab)
    }

    public static var indigo700Color: Color {
        Color(rgb: 0x303f9f)
    }

    public static var indigo800Color: Color {
        Color(rgb: 0x283593)
    }

    public static var indigo900Color: Color {
        Color(rgb: 0x1a237e)
    }

    public static var indigoA100Color: Color {
        Color(rgb: 0x8c9eff)
    }

    public static var indigoA200Color: Color {
        Color(rgb: 0x536dfe)
    }

    public static var indigoA400Color: Color {
        Color(rgb: 0x3d5afe)
    }

    public static var indigoA700Color: Color {
        Color(rgb: 0x304ffe)
    }

    // MARK: - Blue
    
    public static var blue50Color: Color {
        Color(rgb: 0xe3f2fd)
    }

    public static var blue100Color: Color {
        Color(rgb: 0xbbdefb)
    }

    public static var blue200Color: Color {
        Color(rgb: 0x90caf9)
    }

    public static var blue300Color: Color {
        Color(rgb: 0x64b5f6)
    }

    public static var blue400Color: Color {
        Color(rgb: 0x42a5f5)
    }

    public static var blue500Color: Color {
        Color(rgb: 0x2196f3)
    }

    public static var blue600Color: Color {
        Color(rgb: 0x1e88e5)
    }

    public static var blue700Color: Color {
        Color(rgb: 0x1976d2)
    }

    public static var blue800Color: Color {
        Color(rgb: 0x1565c0)
    }

    public static var blue900Color: Color {
        Color(rgb: 0x0d47a1)
    }

    public static var blueA100Color: Color {
        Color(rgb: 0x82b1ff)
    }

    public static var blueA200Color: Color {
        Color(rgb: 0x448aff)
    }

    public static var blueA400Color: Color {
        Color(rgb: 0x2979ff)
    }

    public static var blueA700Color: Color {
        Color(rgb: 0x2962ff)
    }

    // MARK: - Light-blue
    
    public static var lightBlue50Color: Color {
        Color(rgb: 0xe1f5fe)
    }

    public static var lightBlue100Color: Color {
        Color(rgb: 0xb3e5fc)
    }

    public static var lightBlue200Color: Color {
        Color(rgb: 0x81d4fa)
    }

    public static var lightBlue300Color: Color {
        Color(rgb: 0x4fc3f7)
    }

    public static var lightBlue400Color: Color {
        Color(rgb: 0x29b6f6)
    }

    public static var lightBlue500Color: Color {
        Color(rgb: 0x03a9f4)
    }

    public static var lightBlue600Color: Color {
        Color(rgb: 0x039be5)
    }

    public static var lightBlue700Color: Color {
        Color(rgb: 0x0288d1)
    }

    public static var lightBlue800Color: Color {
        Color(rgb: 0x0277bd)
    }

    public static var lightBlue900Color: Color {
        Color(rgb: 0x01579b)
    }

    public static var lightBlueA100Color: Color {
        Color(rgb: 0x80d8ff)
    }

    public static var lightBlueA200Color: Color {
        Color(rgb: 0x40c4ff)
    }

    public static var lightBlueA400Color: Color {
        Color(rgb: 0x00b0ff)
    }

    public static var lightBlueA700Color: Color {
        Color(rgb: 0x0091ea)
    }

    // MARK: - Cyan
    
    public static var cyan50Color: Color {
        Color(rgb: 0xe0f7fa)
    }

    public static var cyan100Color: Color {
        Color(rgb: 0xb2ebf2)
    }

    public static var cyan200Color: Color {
        Color(rgb: 0x80deea)
    }

    public static var cyan300Color: Color {
        Color(rgb: 0x4dd0e1)
    }

    public static var cyan400Color: Color {
        Color(rgb: 0x26c6da)
    }

    public static var cyan500Color: Color {
        Color(rgb: 0x00bcd4)
    }

    public static var cyan600Color: Color {
        Color(rgb: 0x00acc1)
    }

    public static var cyan700Color: Color {
        Color(rgb: 0x0097a7)
    }

    public static var cyan800Color: Color {
        Color(rgb: 0x00838f)
    }

    public static var cyan900Color: Color {
        Color(rgb: 0x006064)
    }

    public static var cyanA100Color: Color {
        Color(rgb: 0x84ffff)
    }

    public static var cyanA200Color: Color {
        Color(rgb: 0x18ffff)
    }

    public static var cyanA400Color: Color {
        Color(rgb: 0x00e5ff)
    }

    public static var cyanA700Color: Color {
        Color(rgb: 0x00b8d4)
    }

    // MARK: - Teal
    
    public static var teal50Color: Color {
        Color(rgb: 0xe0f2f1)
    }

    public static var teal100Color: Color {
        Color(rgb: 0xb2dfdb)
    }

    public static var teal200Color: Color {
        Color(rgb: 0x80cbc4)
    }

    public static var teal300Color: Color {
        Color(rgb: 0x4db6ac)
    }

    public static var teal400Color: Color {
        Color(rgb: 0x26a69a)
    }

    public static var teal500Color: Color {
        Color(rgb: 0x009688)
    }

    public static var teal600Color: Color {
        Color(rgb: 0x00897b)
    }

    public static var teal700Color: Color {
        Color(rgb: 0x00796b)
    }

    public static var teal800Color: Color {
        Color(rgb: 0x00695c)
    }

    public static var teal900Color: Color {
        Color(rgb: 0x004d40)
    }

    public static var tealA100Color: Color {
        Color(rgb: 0xa7ffeb)
    }

    public static var tealA200Color: Color {
        Color(rgb: 0x64ffda)
    }

    public static var tealA400Color: Color {
        Color(rgb: 0x1de9b6)
    }

    public static var tealA700Color: Color {
        Color(rgb: 0x00bfa5)
    }

    // MARK: - Green
    
    public static var green50Color: Color {
        Color(rgb: 0xe8f5e9)
    }

    public static var green100Color: Color {
        Color(rgb: 0xc8e6c9)
    }

    public static var green200Color: Color {
        Color(rgb: 0xa5d6a7)
    }

    public static var green300Color: Color {
        Color(rgb: 0x81c784)
    }

    public static var green400Color: Color {
        Color(rgb: 0x66bb6a)
    }

    public static var green500Color: Color {
        Color(rgb: 0x4caf50)
    }

    public static var green600Color: Color {
        Color(rgb: 0x43a047)
    }

    public static var green700Color: Color {
        Color(rgb: 0x388e3c)
    }

    public static var green800Color: Color {
        Color(rgb: 0x2e7d32)
    }

    public static var green900Color: Color {
        Color(rgb: 0x1b5e20)
    }

    public static var greenA100Color: Color {
        Color(rgb: 0xb9f6ca)
    }

    public static var greenA200Color: Color {
        Color(rgb: 0x69f0ae)
    }

    public static var greenA400Color: Color {
        Color(rgb: 0x00e676)
    }

    public static var greenA700Color: Color {
        Color(rgb: 0x00c853)
    }

    // MARK: - Light-green
    
    public static var lightGreen50Color: Color {
        Color(rgb: 0xf1f8e9)
    }

    public static var lightGreen100Color: Color {
        Color(rgb: 0xdcedc8)
    }

    public static var lightGreen200Color: Color {
        Color(rgb: 0xc5e1a5)
    }

    public static var lightGreen300Color: Color {
        Color(rgb: 0xaed581)
    }

    public static var lightGreen400Color: Color {
        Color(rgb: 0x9ccc65)
    }

    public static var lightGreen500Color: Color {
        Color(rgb: 0x8bc34a)
    }

    public static var lightGreen600Color: Color {
        Color(rgb: 0x7cb342)
    }

    public static var lightGreen700Color: Color {
        Color(rgb: 0x689f38)
    }

    public static var lightGreen800Color: Color {
        Color(rgb: 0x558b2f)
    }

    public static var lightGreen900Color: Color {
        Color(rgb: 0x33691e)
    }

    public static var lightGreenA100Color: Color {
        Color(rgb: 0xccff90)
    }

    public static var lightGreenA200Color: Color {
        Color(rgb: 0xb2ff59)
    }

    public static var lightGreenA400Color: Color {
        Color(rgb: 0x76ff03)
    }

    public static var lightGreenA700Color: Color {
        Color(rgb: 0x64dd17)
    }

    // MARK: - Lime
    
    public static var lime50Color: Color {
        Color(rgb: 0xf9fbe7)
    }

    public static var lime100Color: Color {
        Color(rgb: 0xf0f4c3)
    }

    public static var lime200Color: Color {
        Color(rgb: 0xe6ee9c)
    }

    public static var lime300Color: Color {
        Color(rgb: 0xdce775)
    }

    public static var lime400Color: Color {
        Color(rgb: 0xd4e157)
    }

    public static var lime500Color: Color {
        Color(rgb: 0xcddc39)
    }

    public static var lime600Color: Color {
        Color(rgb: 0xc0ca33)
    }

    public static var lime700Color: Color {
        Color(rgb: 0xafb42b)
    }

    public static var lime800Color: Color {
        Color(rgb: 0x9e9d24)
    }

    public static var lime900Color: Color {
        Color(rgb: 0x827717)
    }

    public static var limeA100Color: Color {
        Color(rgb: 0xf4ff81)
    }

    public static var limeA200Color: Color {
        Color(rgb: 0xeeff41)
    }

    public static var limeA400Color: Color {
        Color(rgb: 0xc6ff00)
    }

    public static var limeA700Color: Color {
        Color(rgb: 0xaeea00)
    }

    // MARK: - Yellow
    
    public static var yellow50Color: Color {
        Color(rgb: 0xfffde7)
    }

    public static var yellow100Color: Color {
        Color(rgb: 0xfff9c4)
    }

    public static var yellow200Color: Color {
        Color(rgb: 0xfff59d)
    }

    public static var yellow300Color: Color {
        Color(rgb: 0xfff176)
    }

    public static var yellow400Color: Color {
        Color(rgb: 0xffee58)
    }

    public static var yellow500Color: Color {
        Color(rgb: 0xffeb3b)
    }

    public static var yellow600Color: Color {
        Color(rgb: 0xfdd835)
    }

    public static var yellow700Color: Color {
        Color(rgb: 0xfbc02d)
    }

    public static var yellow800Color: Color {
        Color(rgb: 0xf9a825)
    }

    public static var yellow900Color: Color {
        Color(rgb: 0xf57f17)
    }

    public static var yellowA100Color: Color {
        Color(rgb: 0xffff8d)
    }

    public static var yellowA200Color: Color {
        Color(rgb: 0xffff00)
    }

    public static var yellowA400Color: Color {
        Color(rgb: 0xffea00)
    }

    public static var yellowA700Color: Color {
        Color(rgb: 0xffd600)
    }

    // MARK: - Amber
    
    public static var amber50Color: Color {
        Color(rgb: 0xfff8e1)
    }

    public static var amber100Color: Color {
        Color(rgb: 0xffecb3)
    }

    public static var amber200Color: Color {
        Color(rgb: 0xffe082)
    }

    public static var amber300Color: Color {
        Color(rgb: 0xffd54f)
    }

    public static var amber400Color: Color {
        Color(rgb: 0xffca28)
    }

    public static var amber500Color: Color {
        Color(rgb: 0xffc107)
    }

    public static var amber600Color: Color {
        Color(rgb: 0xffb300)
    }

    public static var amber700Color: Color {
        Color(rgb: 0xffa000)
    }

    public static var amber800Color: Color {
        Color(rgb: 0xff8f00)
    }

    public static var amber900Color: Color {
        Color(rgb: 0xff6f00)
    }

    public static var amberA100Color: Color {
        Color(rgb: 0xffe57f)
    }

    public static var amberA200Color: Color {
        Color(rgb: 0xffd740)
    }

    public static var amberA400Color: Color {
        Color(rgb: 0xffc400)
    }

    public static var amberA700Color: Color {
        Color(rgb: 0xffab00)
    }

    // MARK: - Orange
    
    public static var orange50Color: Color {
        Color(rgb: 0xfff3e0)
    }

    public static var orange100Color: Color {
        Color(rgb: 0xffe0b2)
    }

    public static var orange200Color: Color {
        Color(rgb: 0xffcc80)
    }

    public static var orange300Color: Color {
        Color(rgb: 0xffb74d)
    }

    public static var orange400Color: Color {
        Color(rgb: 0xffa726)
    }

    public static var orange500Color: Color {
        Color(rgb: 0xff9800)
    }

    public static var orange600Color: Color {
        Color(rgb: 0xfb8c00)
    }

    public static var orange700Color: Color {
        Color(rgb: 0xf57c00)
    }

    public static var orange800Color: Color {
        Color(rgb: 0xef6c00)
    }

    public static var orange900Color: Color {
        Color(rgb: 0xe65100)
    }

    public static var orangeA100Color: Color {
        Color(rgb: 0xffd180)
    }

    public static var orangeA200Color: Color {
        Color(rgb: 0xffab40)
    }

    public static var orangeA400Color: Color {
        Color(rgb: 0xff9100)
    }

    public static var orangeA700Color: Color {
        Color(rgb: 0xff6d00)
    }

    // MARK: - Deep-orange
    
    public static var deepOrange50Color: Color {
        Color(rgb: 0xfbe9e7)
    }

    public static var deepOrange100Color: Color {
        Color(rgb: 0xffccbc)
    }

    public static var deepOrange200Color: Color {
        Color(rgb: 0xffab91)
    }

    public static var deepOrange300Color: Color {
        Color(rgb: 0xff8a65)
    }

    public static var deepOrange400Color: Color {
        Color(rgb: 0xff7043)
    }

    public static var deepOrange500Color: Color {
        Color(rgb: 0xff5722)
    }

    public static var deepOrange600Color: Color {
        Color(rgb: 0xf4511e)
    }

    public static var deepOrange700Color: Color {
        Color(rgb: 0xe64a19)
    }

    public static var deepOrange800Color: Color {
        Color(rgb: 0xd84315)
    }

    public static var deepOrange900Color: Color {
        Color(rgb: 0xbf360c)
    }

    public static var deepOrangeA100Color: Color {
        Color(rgb: 0xff9e80)
    }

    public static var deepOrangeA200Color: Color {
        Color(rgb: 0xff6e40)
    }

    public static var deepOrangeA400Color: Color {
        Color(rgb: 0xff3d00)
    }

    public static var deepOrangeA700Color: Color {
        Color(rgb: 0xdd2c00)
    }

    // MARK: - Brown
    
    public static var brown50Color: Color {
        Color(rgb: 0xefebe9)
    }

    public static var brown100Color: Color {
        Color(rgb: 0xd7ccc8)
    }

    public static var brown200Color: Color {
        Color(rgb: 0xbcaaa4)
    }

    public static var brown300Color: Color {
        Color(rgb: 0xa1887f)
    }

    public static var brown400Color: Color {
        Color(rgb: 0x8d6e63)
    }

    public static var brown500Color: Color {
        Color(rgb: 0x795548)
    }

    public static var brown600Color: Color {
        Color(rgb: 0x6d4c41)
    }

    public static var brown700Color: Color {
        Color(rgb: 0x5d4037)
    }

    public static var brown800Color: Color {
        Color(rgb: 0x4e342e)
    }

    public static var brown900Color: Color {
        Color(rgb: 0x3e2723)
    }

    // MARK: - Grey
    
    public static var grey50Color: Color {
        Color(rgb: 0xfafafa)
    }

    public static var grey100Color: Color {
        Color(rgb: 0xf5f5f5)
    }

    public static var grey200Color: Color {
        Color(rgb: 0xeeeeee)
    }

    public static var grey300Color: Color {
        Color(rgb: 0xe0e0e0)
    }

    public static var grey400Color: Color {
        Color(rgb: 0xbdbdbd)
    }

    public static var grey500Color: Color {
        Color(rgb: 0x9e9e9e)
    }

    public static var grey600Color: Color {
        Color(rgb: 0x757575)
    }

    public static var grey700Color: Color {
        Color(rgb: 0x616161)
    }

    public static var grey800Color: Color {
        Color(rgb: 0x424242)
    }

    public static var grey900Color: Color {
        Color(rgb: 0x212121)
    }

    // MARK: - Blue-grey
    
    public static var blueGrey50Color: Color {
        Color(rgb: 0xeceff1)
    }

    public static var blueGrey100Color: Color {
        Color(rgb: 0xcfd8dc)
    }

    public static var blueGrey200Color: Color {
        Color(rgb: 0xb0bec5)
    }

    public static var blueGrey300Color: Color {
        Color(rgb: 0x90a4ae)
    }

    public static var blueGrey400Color: Color {
        Color(rgb: 0x78909c)
    }

    public static var blueGrey500Color: Color {
        Color(rgb: 0x607d8b)
    }

    public static var blueGrey600Color: Color {
        Color(rgb: 0x546e7a)
    }

    public static var blueGrey700Color: Color {
        Color(rgb: 0x455a64)
    }

    public static var blueGrey800Color: Color {
        Color(rgb: 0x37474f)
    }

    public static var blueGrey900Color: Color {
        Color(rgb: 0x263238)
    }
}

// MARK: - Palettes

extension Color {
    public static var primaryRed: Color {
        Color(light: .red800Color, dark: .red800Color.opacity(0.95))
    }
    
    public static var primaryOrange: Color {
        Color(light: .orange700Color, dark: .orange700Color.opacity(0.95))
    }

    public static var primaryYellow: Color {
        Color(light: .yellow800Color, dark: .yellow800Color.opacity(0.95))
    }
    
    public static var primaryBlue: Color {
        Color(light: .blue600Color, dark: .blue800Color)
    }
    
    public static var redText: Color {
        Color(light: .red900Color, dark: .red800Color)
    }
    
    public static var orangeText: Color {
        Color(light: .orange700Color, dark: .orange800Color)
    }
    
    public static var secondaryText: Color {
        Color(uiColor: .secondaryLabel)
    }
}

// MARK: - Gradients

extension Array where Element == Color {
    public static var gradientPurple: [Color] {
        [
            Color(rgb: 0xf06744),
            Color(rgb: 0xee4c53),
            Color(rgb: 0xd35e94),
            Color(rgb: 0x9c6ca5),
            Color(rgb: 0x6782be)
        ]
    }
    
    public static var gradientOrange: [Color] {
        [
            Color(light: Color(rgb: 0xd14545), dark: Color(rgb: 0xfc575e)),
            Color(light: Color(rgb: 0xff4e00), dark: Color(rgb: 0xff9933))
        ]
    }
}
