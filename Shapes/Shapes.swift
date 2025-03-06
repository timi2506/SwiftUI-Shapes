//
//  Shapes.swift
//  Shapes
//
//  Created by Tim on 06.03.25.
//

import SwiftUI

struct ShapesView: View {
    @State var showSettings = false
    @State var rectangles: [RectangleItem] = [
        RectangleItem(name: "Rectangle 1", cornerRadius: 10, foregroundStyleString: "Color", color: .red, offset: CGSize(width: 10, height: 0), scale: 1, width: 100, height: 200)
    ]
    @State var circles: [CircleItem] = [
        CircleItem(name: "Circle 1", foregroundStyleString: "Color", color: .green, offset: CGSize(width: 10, height: 0), scale: 1, width: 100, height: 200)
    ]
    var body: some View {
        ZStack {
            Rectangles
            Circles
        }
        .toolbar(content:{
            ToolbarItem {
                Button("Settings", systemImage: "gear") {
                    showSettings.toggle()
                } .popover(isPresented: $showSettings) {
                    Settings.frame(minWidth: 375)
                }
            }
            ToolbarItem {
                Menu("Add", systemImage: "plus") {
                    Button("Rectangle") {
                        rectangles.append(RectangleItem(name: "Rectangle \(rectangles.count + 1)", cornerRadius: 0, foregroundStyleString: "Color", color: .primary, offset: CGSize(width: 0, height: 0), scale: 1, width: 100, height: 100))
                    }
                    Button("Circle") {
                        circles.append(CircleItem(name: "Circle \(circles.count + 1)", foregroundStyleString: "Color", color: .primary, offset: CGSize(width: 0, height: 0), scale: 1, width: 100, height: 100))
                    }
                }
            }
        })
    }
    let materials: [String] = [
        ".ultraThinMaterial",
        ".thinMaterial",
        ".regularMaterial",
        ".thickMaterial",
        ".ultraThickMaterial",
    ]
    var Settings: some View {
        VStack {
            Form {
                ForEach(circles.indices, id: \.self) { index in
                    Section(circles[index].name) {
                        VStack {
                            Picker("Foreground Style", selection: $circles[index].foregroundStyleString) {
                                Text("Color").tag("Color")
                                Text("Material").tag("Material")
                            }
                            if circles[index].foregroundStyleString == "Color" {
                                ColorPicker("Color", selection: $circles[index].color)
                            } else {
                                Picker("Material", selection: $circles[index].materialString) {
                                    ForEach(materials, id: \.self) { material in
                                        Text(material)
                                    }
                                } .onChange(of: circles[index].materialString) { newValue in
                                    if newValue == ".ultraThinMaterial" {
                                        circles[index].material = .ultraThinMaterial
                                    } else if newValue == ".thinMaterial" {
                                        circles[index].material = .thinMaterial
                                    } else if newValue == ".regularMaterial" {
                                        circles[index].material = .regularMaterial
                                    } else if newValue == ".thickMaterial" {
                                        circles[index].material = .thickMaterial
                                    } else if newValue == ".ultraThickMaterial" {
                                        circles[index].material = .ultraThickMaterial
                                    }
                                }
                            }
                        }
                        HStack {
                            Text("Scale")
                            Slider(value: $circles[index].scale, in: 0.5...3, step: 0.25)
                            Text(circles[index].scale.description).frame(width: 30)
                            
                        }
                        HStack {
                            Text("Width")
                            Slider(value: $circles[index].width, in: 1...750)
                            Text(circles[index].width.rounded(.up).description).frame(width: 50)
                        }
                        HStack {
                            Text("Height")
                            Slider(value: $circles[index].height, in: 1...750)
                            Text(circles[index].height.rounded(.up).description).frame(width: 50)
                        }
                        HStack {
                            Spacer()
                            Button("Center") {
                                circles[index].offset = .zero
                            } .buttonStyle(PlainButtonStyle())
                            Spacer()
                            Divider()
                            Spacer()
                            Button("Point out") {
                                circles[index].border = true
                            } .buttonStyle(PlainButtonStyle()).disabled(circles[index].border)
                            Spacer()
                        }
                    }
                }
            } .formStyle(.grouped).scrollIndicators(.never)
            Divider()
            Form {
                ForEach(rectangles.indices, id: \.self) { index in
                    Section(rectangles[index].name) {
                        HStack {
                            Text("Corner Radius")
                            Slider(value: $rectangles[index].cornerRadius, in: 0...100)
                        }
                        VStack {
                            Picker("Foreground Style", selection: $rectangles[index].foregroundStyleString) {
                                Text("Color").tag("Color")
                                Text("Material").tag("Material")
                            }
                            if rectangles[index].foregroundStyleString == "Color" {
                                ColorPicker("Color", selection: $rectangles[index].color)
                            } else {
                                Picker("Material", selection: $rectangles[index].materialString) {
                                    ForEach(materials, id: \.self) { material in
                                        Text(material)
                                    }
                                } .onChange(of: rectangles[index].materialString) { newValue in
                                    if newValue == ".ultraThinMaterial" {
                                        rectangles[index].material = .ultraThinMaterial
                                    } else if newValue == ".thinMaterial" {
                                        rectangles[index].material = .thinMaterial
                                    } else if newValue == ".regularMaterial" {
                                        rectangles[index].material = .regularMaterial
                                    } else if newValue == ".thickMaterial" {
                                        rectangles[index].material = .thickMaterial
                                    } else if newValue == ".ultraThickMaterial" {
                                        rectangles[index].material = .ultraThickMaterial
                                    }
                                }
                            }
                        }
                        HStack {
                            Text("Scale")
                            Slider(value: $rectangles[index].scale, in: 0.5...3, step: 0.25)
                            Text(rectangles[index].scale.description).frame(width: 30)
                            
                        }
                        HStack {
                            Text("Width")
                            Slider(value: $rectangles[index].width, in: 1...750)
                            Text(rectangles[index].width.rounded(.up).description).frame(width: 50)
                        }
                        HStack {
                            Text("Height")
                            Slider(value: $rectangles[index].height, in: 1...750)
                            Text(rectangles[index].height.rounded(.up).description).frame(width: 50)
                        }
                        HStack {
                            Spacer()
                            Button("Center") {
                                rectangles[index].offset = .zero
                            } .buttonStyle(PlainButtonStyle())
                            Spacer()
                            Divider()
                            Spacer()
                            Button("Point out") {
                                rectangles[index].border = true
                            } .buttonStyle(PlainButtonStyle()).disabled(rectangles[index].border)
                            Spacer()
                        }
                    }
                }
            } .formStyle(.grouped).scrollIndicators(.never)
        }
        .presentationDetents([.medium, .large])
        .presentationBackgroundInteraction(
            .enabled(upThrough: .medium)
        )
    }
    var Circles: some View {
        ForEach(circles.indices, id: \.self) { index in
                        Circle()
                            .foregroundStyle(circles[index].foregroundStyle())
                            .scaleEffect(circles[index].scale)
                            .offset(circles[index].offset)
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        circles[index].offset = CGSize(width: circles[index].lastOffset.width + gesture.translation.width, height: circles[index].lastOffset.height + gesture.translation.height)
                                    }
                                    .onEnded { _ in
                                        circles[index].lastOffset = circles[index].offset
                                    }
                            )
                            .simultaneousGesture(
                                TapGesture()
                                    .onEnded { _ in
                                        circles[index].popover = true
                                    }
                            )
                            .frame(width: circles[index].width, height: circles[index].height)
                            .background(
                                Circle()
                                    .stroke(circles[index].border ? .red : .clear, lineWidth: 10)
                                    .scaleEffect(circles[index].scale)
                                    .offset(circles[index].offset)
                                    .frame(width: circles[index].width, height: circles[index].height)
                                    .onChange(of: circles[index].border) { newValue in
                                        if newValue {
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                                circles[index].border = false
                                            }
                                        }
                                    }
                            )
                            .popover(isPresented: $circles[index].popover) {
                                Form {
                                    Section(circles[index].name) {
                                        VStack {
                                            Picker("Foreground Style", selection: $circles[index].foregroundStyleString) {
                                                Text("Color").tag("Color")
                                                Text("Material").tag("Material")
                                            }
                                            if circles[index].foregroundStyleString == "Color" {
                                                ColorPicker("Color", selection: $circles[index].color)
                                            } else {
                                                Picker("Material", selection: $circles[index].materialString) {
                                                    ForEach(materials, id: \.self) { material in
                                                        Text(material)
                                                    }
                                                } .onChange(of: circles[index].materialString) { newValue in
                                                    if newValue == ".ultraThinMaterial" {
                                                        circles[index].material = .ultraThinMaterial
                                                    } else if newValue == ".thinMaterial" {
                                                        circles[index].material = .thinMaterial
                                                    } else if newValue == ".regularMaterial" {
                                                        circles[index].material = .regularMaterial
                                                    } else if newValue == ".thickMaterial" {
                                                        circles[index].material = .thickMaterial
                                                    } else if newValue == ".ultraThickMaterial" {
                                                        circles[index].material = .ultraThickMaterial
                                                    }
                                                }
                                            }
                                        }
                                        HStack {
                                            Text("Scale")
                                            Slider(value: $circles[index].scale, in: 0.5...3, step: 0.25)
                                            Text(circles[index].scale.description).frame(width: 30)

                                        }
                                        HStack {
                                            Text("Width")
                                            Slider(value: $circles[index].width, in: 1...750)
                                            Text(circles[index].width.rounded(.up).description).frame(width: 50)
                                        }
                                        HStack {
                                            Text("Height")
                                            Slider(value: $circles[index].height, in: 1...750)
                                            Text(circles[index].height.rounded(.up).description).frame(width: 50)
                                        }
                                        HStack {
                                            Spacer()
                                            Button("Center") {
                                                circles[index].offset = .zero
                                            } .buttonStyle(PlainButtonStyle())
                                            Spacer()
                                            Divider()
                                            Spacer()
                                            Button("Point out") {
                                                circles[index].border = true
                                            } .buttonStyle(PlainButtonStyle()).disabled(circles[index].border)
                                            Spacer()
                                        }
                                    }
                                }
                                .formStyle(.grouped)
#if os(iOS)
            .presentationDragIndicator(.visible)
            .presentationDetents([.height(250),.medium, .large])
            .presentationBackgroundInteraction(
                .enabled(upThrough: .medium)
            )
#endif
            .presentationCornerRadius(25)
                            }
                        
                    }
    }
    var Rectangles: some View {
        ForEach(rectangles.indices, id: \.self) { index in
            RoundedRectangle(cornerRadius: rectangles[index].cornerRadius)
                .foregroundStyle(rectangles[index].foregroundStyle())
                .scaleEffect(rectangles[index].scale)
                .offset(rectangles[index].offset)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            rectangles[index].offset = CGSize(width: rectangles[index].lastOffset.width + gesture.translation.width, height: rectangles[index].lastOffset.height + gesture.translation.height)
                        }
                        .onEnded { _ in
                            rectangles[index].lastOffset = rectangles[index].offset
                        }
                )
                .simultaneousGesture(
                    TapGesture()
                        .onEnded { _ in
                            rectangles[index].popover = true
                        }
                )
                .frame(width: rectangles[index].width, height: rectangles[index].height)
                .background(
                    RoundedRectangle(cornerRadius: rectangles[index].cornerRadius)
                        .stroke(rectangles[index].border ? .red : .clear, lineWidth: 10)
                        .scaleEffect(rectangles[index].scale)
                        .offset(rectangles[index].offset)
                        .frame(width: rectangles[index].width, height: rectangles[index].height)
                        .onChange(of: rectangles[index].border) { newValue in
                            if newValue {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    rectangles[index].border = false
                                }
                            }
                        }
                )
                .popover(isPresented: $rectangles[index].popover) {
                    Form {
                        Section(rectangles[index].name) {
                            HStack {
                                Text("Corner Radius")
                                Slider(value: $rectangles[index].cornerRadius, in: 0...100)
                            }
                            VStack {
                                Picker("Foreground Style", selection: $rectangles[index].foregroundStyleString) {
                                    Text("Color").tag("Color")
                                    Text("Material").tag("Material")
                                }
                                if rectangles[index].foregroundStyleString == "Color" {
                                    ColorPicker("Color", selection: $rectangles[index].color)
                                } else {
                                    Picker("Material", selection: $rectangles[index].materialString) {
                                        ForEach(materials, id: \.self) { material in
                                            Text(material)
                                        }
                                    } .onChange(of: rectangles[index].materialString) { newValue in
                                        if newValue == ".ultraThinMaterial" {
                                            rectangles[index].material = .ultraThinMaterial
                                        } else if newValue == ".thinMaterial" {
                                            rectangles[index].material = .thinMaterial
                                        } else if newValue == ".regularMaterial" {
                                            rectangles[index].material = .regularMaterial
                                        } else if newValue == ".thickMaterial" {
                                            rectangles[index].material = .thickMaterial
                                        } else if newValue == ".ultraThickMaterial" {
                                            rectangles[index].material = .ultraThickMaterial
                                        }
                                    }
                                }
                            }
                            HStack {
                                Text("Scale")
                                Slider(value: $rectangles[index].scale, in: 0.5...3, step: 0.25)
                                Text(rectangles[index].scale.description).frame(width: 30)

                            }
                            HStack {
                                Text("Width")
                                Slider(value: $rectangles[index].width, in: 1...750)
                                Text(rectangles[index].width.rounded(.up).description).frame(width: 50)
                            }
                            HStack {
                                Text("Height")
                                Slider(value: $rectangles[index].height, in: 1...750)
                                Text(rectangles[index].height.rounded(.up).description).frame(width: 50)
                            }
                            HStack {
                                Spacer()
                                Button("Center") {
                                    rectangles[index].offset = .zero
                                } .buttonStyle(PlainButtonStyle())
                                Spacer()
                                Divider()
                                Spacer()
                                Button("Point out") {
                                    rectangles[index].border = true
                                } .buttonStyle(PlainButtonStyle()).disabled(rectangles[index].border)
                                Spacer()
                            }
                        }
                    }
                    .formStyle(.grouped)
#if os(iOS)
            .presentationDragIndicator(.visible)
            .presentationDetents([.height(250),.medium, .large])
            .presentationBackgroundInteraction(
                .enabled(upThrough: .medium)
            )
#endif
            .presentationCornerRadius(25)
                }
            
        }
    }
}

struct RectangleItem: Identifiable {
    let id = UUID()
    let name: String
    var cornerRadius: CGFloat
    var foregroundStyleString: String
    var color: Color
    var materialString = ".ultraThinMaterial"
    var material: Material = .ultraThinMaterial
    func foregroundStyle() -> AnyShapeStyle {
        if foregroundStyleString == "Color" {
            return AnyShapeStyle(color)
        } else {
            return AnyShapeStyle(material)
        }
    }
    var offset: CGSize
    var lastOffset = CGSize(width: 0, height: 0)
    var scale: CGFloat
    var width: CGFloat
    var height: CGFloat
    var border = false
    var popover = false
}

struct CircleItem: Identifiable {
    let id = UUID()
    let name: String
    var foregroundStyleString: String
    var color: Color
    var materialString = ".ultraThinMaterial"
    var material: Material = .ultraThinMaterial
    func foregroundStyle() -> AnyShapeStyle {
        if foregroundStyleString == "Color" {
            return AnyShapeStyle(color)
        } else {
            return AnyShapeStyle(material)
        }
    }
    var offset: CGSize
    var lastOffset = CGSize(width: 0, height: 0)
    var scale: CGFloat
    var width: CGFloat
    var height: CGFloat
    var border = false
    var popover = false
}
