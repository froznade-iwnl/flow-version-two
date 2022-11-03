//
//  ChartView.swift
//  Flow_V2
//
//  Created by CTSS Students on 2/11/22.
//

import SwiftUI
import Charts

struct ChartView: View {
    
    var data = EmotionManager().emotions
    
    var body: some View {
        VStack {
            Chart {
                ForEach(data) { emotion in
                    LineMark(x: .value("days", emotion.id), y: .value("Emotion", emotion.emotionID))
                        .foregroundStyle(Color.textColor)
                }
            }.frame(height: 300)
                .chartYAxis {
                    AxisMarks(position: .leading)
                }
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
