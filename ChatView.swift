import SwiftUI

struct ChatMessage: Identifiable {
    let id = UUID()
    let speaker: Speaker
    let message: String
}

enum Speaker {
    case elephant
    case eagle

    var name: String {
        switch self {
        case .elephant:
            return "Ellie the Elephant"
        case .eagle:
            return "Eddie the Eagle"
        }
    }

    var color: Color {
        switch self {
        case .elephant:
            return Color.gray
        case .eagle:
            return Color.blue
        }
    }

    var avatar: String {
        switch self {
        case .elephant:
            return "🐘" // elephant emoji
        case .eagle:
            return "🦅" // eagle emoji
        }
    }
}

struct ChatView: View {
    @State private var messages: [ChatMessage] = [
        ChatMessage(speaker: .elephant, message: "Hello there!"),
        ChatMessage(speaker: .eagle, message: "Hi! Enjoying the view from up here."),
        ChatMessage(speaker: .elephant, message: "I'm just roaming the plains."),
        ChatMessage(speaker: .eagle, message: "Sounds fun! Let's chat."),
    ]

    var body: some View {
        NavigationView {
            List(messages) { msg in
                HStack(alignment: .top) {
                    Text(msg.speaker.avatar)
                        .font(.largeTitle)
                    VStack(alignment: .leading) {
                        Text(msg.speaker.name)
                            .font(.headline)
                            .foregroundColor(msg.speaker.color)
                        Text(msg.message)
                    }
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Animal Chat")
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
