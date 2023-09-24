//
import SwiftUI



struct CheckInInstance {
    var symptom: [Symptom] = []
    var med: [Med] = []
    var date: Date
    var pain: Int
}

struct Symptom {
    var name: String
    var isChecked: Bool = false
}

struct Med {
    var name: String
    var isChecked: Bool = false
}

var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMM d, yyyy"
    return formatter
}

var timeFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "h:mm a"
    return formatter
}

struct CheckInPortal: View {
    @State private var checkInList: [CheckInInstance] = []
    
    @State private var painLevel = 0
    @State private var symptoms = [ Symptom(name: "Fever"), Symptom(name: "Nausea"), Symptom(name: "Slurred speech"), Symptom(name: "Muscle pain"),
        Symptom(name: "")
    ]
    @State private var newSymptom = ""

    
    @State private var medicines = [ Med(name: "Penicillin"), Med(name: "Vitamin C")]
    
    @State private var day = Date()
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                HStack{
                    Text("Daily Check-in")
                        .font(Font.custom("Avenir", size: 30))
                        .foregroundStyle(Color("DarkBlue"))
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.vertical, 10)
                
                ScrollView{
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
                                .background(painLevel == 5 ? Color.cyan : Color.white)
                                .clipShape(Circle())
                        }
                        Button {painLevel = 4} label: {
                            Image("pain4")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                                .background(painLevel == 4 ? Color.cyan : Color.white)
                                .clipShape(Circle())
                        }
                        Button {painLevel = 3} label: {
                            Image("pain3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                                .background(painLevel == 3 ? Color.cyan : Color.white)
                                .clipShape(Circle())
                        }
                        Button {painLevel = 2} label: {
                            Image("pain2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                                .background(painLevel == 2 ? Color.cyan : Color.white)
                                .clipShape(Circle())
                        }
                        Button {painLevel = 1} label: {
                            Image("pain1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                                .background(painLevel == 1 ? Color.cyan : Color.white)
                                .clipShape(Circle())
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                    Text("Symptoms")
                        .padding(.leading, 20)
                        .font(Font.custom("Avenir", size: 20))
                    HStack(alignment: .top, spacing: 10) { // not padded??
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(symptoms.indices, id: \.self) { index in
                                HStack(alignment: .top, spacing: 10) {
                                    Toggle(isOn: $symptoms[index].isChecked) {
                                        Text(symptoms[index].name)
                                            .padding(5)
                                        if index == symptoms.count - 1 {
                                            TextField("Add custom symptom", text: $newSymptom)
                                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                                .font(Font.custom("Avenir", size: 20))
                                            Spacer()
                                            
                                            Button(action: {
                                                if !newSymptom.isEmpty {
                                                    let insertIndex = symptoms.count - 1
                                                    symptoms.insert(Symptom(name: newSymptom, isChecked: true), at: insertIndex)
                                                    newSymptom = ""
                                                }
                                            }) {
                                                Image(systemName: "plus.circle.fill")
                                                    .foregroundColor(.blue)
                                                    .font(.system(size: 20))
                                            }
                                        } else {
                                            Spacer()
                                            Button(action: {
                                                symptoms.remove(at: index)
                                            }) {
                                                Image(systemName: "minus.circle.fill")
                                                    .foregroundColor(.red)
                                                    .font(.system(size: 20))
                                            }
                                        }
                                    }
                                    .toggleStyle(CheckboxToggleStyle())
                                    
                                    
                                    
                                }
                                .foregroundStyle(Color("DarkGrey"))
                            }
                            
                        }
                        .padding(5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color("LightGrey"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Text("Medication")
                        .padding(.horizontal, 20)
                        .font(Font.custom("Avenir", size: 20))
                    
                    HStack(alignment: .top, spacing: 10) {
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("\(day, formatter: dateFormatter)")
                                .font(Font.custom("Avenir", size:15))
                            
                            ForEach(medicines.indices, id: \.self) { index in
                                HStack(alignment: .top, spacing: 10) {
                                    Toggle(isOn: $medicines[index].isChecked) {
                                        Text(medicines[index].name)
                                            .padding(5)
                                    }
                                    .toggleStyle(CheckboxToggleStyle())
                                    
                                }
                                .foregroundStyle(Color("DarkGrey"))
                            }
                            
                            HStack {
                                Spacer()
                                Text("View past appointment records")
                                    .font(Font.custom("Avenir", size: 18))
                                    .foregroundStyle(Color.blue)
                            }
                        }
                        .padding(5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color("LightGrey"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    NavigationLink(destination: CheckInSubmit()) {
                            Text("Submit")
                                .padding(.horizontal)
                                .foregroundColor(.white)
                                .background(Color("DarkBlue"))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .font(Font.custom("Avenir", size:15))
                        
                    }
                    
                }
                
            }
            
        }

    }
}

struct CheckInPortal_Previews: PreviewProvider {
    static var previews: some View {
        CheckInPortal()
    }
}
