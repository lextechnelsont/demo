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
                MessageRow(message: msg)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Animal Chat")
        }
    }
}

private struct MessageRow: View {
    let message: ChatMessage

    var body: some View {
        HStack {
            if message.speaker == .elephant {
                AvatarBubble(message: message)
                Spacer(minLength: 40)
            } else {
                Spacer(minLength: 40)
                AvatarBubble(message: message)
            }
        }
    }
}

private struct AvatarBubble: View {
    let message: ChatMessage

    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            if message.speaker == .elephant {
                Text(message.speaker.avatar)
                    .font(.largeTitle)
            }

            Text(message.message)
                .padding(10)
                .background(message.speaker.color.opacity(0.2))
                .cornerRadius(10)

            if message.speaker == .eagle {
                Text(message.speaker.avatar)
                    .font(.largeTitle)
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
