//
//  ScheduleView.swift
//  tap
//
//  Created by Joshua Mae on 5/9/23.
//

import SwiftUI
import HorizonCalendar

// Weekly work hours view with buttons to send in avail
// List View and Calendar View
// Maybe create some sort of widget?
//
struct ScheduleView: View {
    var body: some View {
        createCalendar()
            .ignoresSafeArea()
    }
    
    private func createCalendar() -> some View {
        let calendar = Calendar.current
        let startDate = calendar.date(from: DateComponents(year: 2023, month: 06, day: 13))!
        let endDate = calendar.date(from: DateComponents(year: 2025, month: 06, day: 13))!
        
        let content = CalendarViewContent(calendar: calendar,
                                          visibleDateRange: startDate...endDate,
                                          monthsLayout: .vertical(options: VerticalMonthsLayoutOptions(scrollsToFirstMonthOnStatusBarTap: true)))
        
        return AnyView(
            CalendarViewRepresentable(content: content)
        )
    }
}

struct CalendarViewRepresentable: UIViewRepresentable {
    let content: CalendarViewContent
    
    func makeUIView(context: Context) -> CalendarView {
        CalendarView(initialContent: content)
    }
    
    func updateUIView(_ uiView: CalendarView, context: Context) {
        // Update the view if needed
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}


//
//final class ScheduleView: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        createCalendar()
//    }
//
//    private func createCalendar() {
//        let calendar = Calendar.current
//        let startDate = calendar.date(from: DateComponents(year: 2023, month: 06, day: 13))!
//        let endDate = calendar.date(from: DateComponents(year: 2025, month: 06, day: 13))!
//
//        let content = CalendarViewContent(calendar: calendar,
//                                          visibleDateRange: startDate...endDate,
//                                          monthsLayout: .vertical(options: VerticalMonthsLayoutOptions()))
//
//        let calendarView = CalendarView(initialContent: content)
//
//        calendarView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(calendarView)
//        NSLayoutConstraint.activate([
//            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            calendarView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
//            calendarView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
//            calendarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
//    }
//}
