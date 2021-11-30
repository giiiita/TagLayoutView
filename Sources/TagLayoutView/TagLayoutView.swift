//
//  TagLayoutView.swift
//  Created by giiiita on 2020/02/17.
//  Copyright © 2020 giiiita. All rights reserved.
//

#if arch(x86_64) || arch(arm64)

import SwiftUI

@available(iOS 13.0, *)
public struct TagLayoutView<Content>: View where Content: View {
    
    private let tags: [String]
    private var tagFont: UIFont
    private let padding: CGFloat
    private let parentWidth: CGFloat
    private let content: (String) -> Content
    private var elementsCountByRow: [Int] = []
    
    public init(_ tags: [String],
                tagFont: UIFont,
                padding: CGFloat,
                parentWidth: CGFloat,
                content: @escaping (String) -> Content) {
        self.tags = tags
        self.tagFont = tagFont
        self.padding = padding
        self.parentWidth = parentWidth
        self.content = content
        self.elementsCountByRow = self.getElementsCountByRow(self.parentWidth)
    }
    
    private func getElementsCountByRow(_ rowSize: CGFloat) -> [Int] {
        let tagWidths = self.tags.map{$0.widthOfString(usingFont: self.tagFont)}

        var currentRowTotalWidth: CGFloat = 0.0
        var currentRowElementsCount: Int = 0
        var result: [Int] = []
        
        for tagWidth in tagWidths {
            let fixedTagWidth = tagWidth + (2 * self.padding)
            if currentRowTotalWidth + fixedTagWidth <= rowSize {
                currentRowTotalWidth += fixedTagWidth
                currentRowElementsCount += 1
                guard result.count != 0 else { result.append(1); continue }
                result[result.count - 1] = currentRowElementsCount
            } else {
                currentRowTotalWidth = fixedTagWidth
                currentRowElementsCount = 1
                result.append(1)
            }
        }
        return result
    }
    
    private func getTag(elementsCountByRow: [Int], rowIndex: Int, elementIndex: Int) -> String {
        let sumOfPreviousRows = elementsCountByRow.enumerated().reduce(0) { total, next in
            if next.offset < rowIndex {
                return total + next.element
            } else {
                return total
            }
        }
        let orderedTagsIndex = sumOfPreviousRows + elementIndex
        guard self.tags.count > orderedTagsIndex else { return "" }
        return self.tags[orderedTagsIndex]
    }
    
    public var body : some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(0 ..< self.elementsCountByRow.count, id: \.self) { rowIndex in
                HStack {
                    ForEach(0 ..< self.elementsCountByRow[rowIndex], id: \.self) { elementIndex in
                        self.content(self.getTag(elementsCountByRow: self.elementsCountByRow, rowIndex: rowIndex, elementIndex: elementIndex))
                    }
                    Spacer()
                }.padding(.vertical, 4)
            }
        }
    }
}

extension String {

    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }

}

#endif
