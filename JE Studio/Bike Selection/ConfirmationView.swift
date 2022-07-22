//
//  ConfirmationView.swift
//  JE Studio
//
//  Created by Daniel Martínez on 16/07/22.
//

import SwiftUI

struct ConfirmationView: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @StateObject var viewModel: ConfirmationViewModel = ConfirmationViewModel()
  @Binding var keepActive: Bool
  let bookedSession: Session

    var body: some View {
      ZStack {
        JEStudioColor.purple500
          .ignoresSafeArea()
        VStack {
          HStack {
            Spacer()
            
            Button("add_to_calendar_label".jeLocalized) {
              viewModel.saveSessionToCalendar(date: bookedSession.date, startHour: bookedSession.hour)
            }
            .padding()
            .font(.jeSubtitle1)
            .foregroundColor(JEStudioColor.purple100)
          }
          VStack(spacing: 40) {
            Text("session_on_label".jeLocalized)
              .font(.jeHeader4)
              .foregroundColor(.white)
              .frame(maxWidth: .infinity)
              .padding(8)
            Text(bookedSession.getFormattedDate())
              .font(.jeHeader5)
              .foregroundColor(.white)
              .lineLimit(1)
            Text("at_label".jeLocalized)
              .font(.jeHeader4)
              .foregroundColor(.white)
            Text(bookedSession.hour)
              .font(.jeHeader5)
              .foregroundColor(.white)
            Text("has_been_booked".jeLocalized)
              .font(.jeHeader5)
              .foregroundColor(.white)
            Image(systemName: "checkmark")
              .resizable()
              .scaledToFit()
              .frame(width: 60, height: 60, alignment: .center)
              .foregroundColor(.green)
          }
          Spacer()
          HStack {
            Button("ready_button".jeLocalized) {
              presentationMode.wrappedValue.dismiss()
              self.keepActive = false
            }
            .padding(8)
            .frame(maxWidth: .infinity)
            .foregroundColor(JEStudioColor.purple500)
            .background(JEStudioColor.purple200)
            .font(.jeHeader3)
          }
        }
      }
      .alert("done_label".jeLocalized, isPresented: $viewModel.successfullyAddedToCalendar) {
        Text("Ok")
      } message: {
        Text("success_added_to_calendar".jeLocalized)
      }

    }
}

//struct ConfirmationView_Previews: PreviewProvider {
//    static var previews: some View {
//        ConfirmationView(date: "Miércoles 24 de Febrero", hour: "8:00")
//    }
//}
