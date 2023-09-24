//
import SwiftUI

struct CheckInPortal: View {
    @State private var painLevel = 0
    @State private var symptoms = ["Fever","Nausea","Slurred speech","Muscle pain"
    ]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                HStack{
                    Text("Daily Check-in")
                        .font(Font.custom("Avenir-Medium", size: 25))
                        .foregroundStyle(Color("DarkBlue"))
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.vertical, 10)
                Text("Pain Level")
                    .padding(.leading, 20)
                    .font(Font.custom("Avenir", size: 20))
                HStack(spacing: 20) {
                    Spacer()
                    Button {painLevel = 5} label: {
                        Image("pain5")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                    }
                    Button {painLevel = 4} label: {
                        Image("pain4")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                    }
                    Button {painLevel = 3} label: {
                        Image("pain3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                    }
                    Button {painLevel = 2} label: {
                        Image("pain2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                    }
                    Button {painLevel = 1} label: {
                        Image("pain1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                
                Text("Symptoms")
                    .padding(.leading, 20)
                    .font(Font.custom("Avenir", size: 20))
                HStack(alignment: .top, spacing: 10) {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(symptoms.indices, id: \.self) { index in
                            HStack(alignment: .top, spacing: 5) {
                                Button {} label: {
                                    Image("plus_box")
                                }
                                Text(symptoms[index])
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                            }
                            .foregroundStyle(Color("DarkGrey"))
                        }
                    }
                    .padding(5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(Color("LightGrey"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal, 20)
                Spacer()
            }
        }
        .background(Color("OffWhite"))
    }
}

struct CheckInPortal_Previews: PreviewProvider {
    static var previews: some View {
        CheckInPortal()
    }
}
