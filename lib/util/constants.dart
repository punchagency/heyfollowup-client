import 'package:hey_follow_up/screens/create_follow_up/model/next_step_model.dart';

import 'color_scheme.dart';

class Constants {
  static const String htmlContent = """
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Networking & Follow-Up Tips</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 20px;
            padding: 20px;
            background-color: #f9f9f9;
        }
        h1 {
            text-align: center;
        }
        h2 {
            color: #333;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin-bottom: 10px;
        }
        strong {
            color: #d6336c;
        }
    </style>
</head>
<body>

    <h2>Mastering the Art of Networking</h2>
    <ul>
        <li>Be intentional about why you want to connect.</li>
        <li>Read the room - Observe body language and setting.</li>
        <li>Use the event context - Everyone is there to connect!</li>
        <li>Look approachable - Open posture, friendly demeanor.</li>
        <li>Practice an icebreaker - A compliment or an observation.</li>
        <li>Leverage group dynamics - Introduce yourself to a group.</li>
        <li>Approach speakers confidently - Be direct, keep it short.</li>
    </ul>

    <h2>Mastering Conversations</h2>
    <strong>2. What to Say When You Meet Someone</strong>
    <ul>
        <li>Use the 'Intro-Compliment-Intent' formula.</li>
        <li>Have small talk ready - Weather, recent news, mutual contacts.</li>
        <li>Express gratitude - "I appreciate you taking the time!"</li>
        <li>Ask thoughtful, open-ended questions - "What inspired you to do what you do?"</li>
        <li>Do not just talk, listen! - Active listening builds trust.</li>
    </ul>

    <h2>Building Strong Connections</h2>
    <strong>3. Establishing Meaningful Relationships</strong>
    <ul>
        <li>Do not focus on what you need - focus on adding value!</li>
        <li>Learn their communication style - Are they direct or casual?</li>
        <li>Follow their cues - If they prefer social media, connect there!</li>
        <li>Engage after meeting - Like or comment on their content.</li>
        <li>Respect their time - Keep your interactions concise.</li>
    </ul>

    <h2>Getting & Storing Contact Info</h2>
    <strong>4. The Contact Exchange</strong>
    <ul>
        <li>Business cards still matter - Keep them in your wallet.</li>
        <li>Use LinkedIn's 'Find Nearby' feature at events.</li>
        <li>If they do not have a card, ask for a preferred contact method.</li>
        <li>Snap a picture of their business card for easy access.</li>
        <li>Save contacts with notes - "Met at XYZ conference; loves AI."</li>
    </ul>

    <h2>The Art of Following Up</h2>
    <strong>5. Following Up the Right Way</strong>
    <ul>
        <li>Send a follow-up within 48 hours while the conversation is fresh.</li>
        <li>Use a personalized message - Mention something specific.</li>
        <li>Follow up in their preferred method (Email, LinkedIn, Text).</li>
        <li>Do not just say "Let's connect" - suggest a time/place.</li>
        <li>Be persistent, not pushy. Follow up 2-3 times if needed.</li>
        <li>Offer value in follow-ups - Share an article, resource, or event.</li>
        <li>If they cancel, reschedule immediately. Set a new date/time.</li>
    </ul>

    <h2>Scheduling & Maintaining Relationships</h2>
    <strong>6. Long-Term Networking Strategy</strong>
    <ul>
        <li>Track your contacts - Use a CRM, Notion, or simple spreadsheet.</li>
        <li>Schedule quarterly check-ins - "Hey, hope all is well! Let's grab coffee."</li>
        <li>Use social media to stay top of mind. Comment on their posts!</li>
        <li>Send 'thinking of you' messages. Example: "I saw this article and thought of you!"</li>
        <li>Celebrate their wins. Send a congratulatory message on promotions, projects, or birthdays.</li>
        <li>Set networking goals. Who do you want to connect with this month?</li>
    </ul>

    <h2>Additional Networking Hacks</h2>
    <strong>7. Networking Beyond the Event</strong>
    <ul>
        <li>Carry a book - It is an easy conversation starter.</li>
        <li>Find common ground quickly - Mutual friends, interests.</li>
        <li>Make introductions for others - Networking is about giving.</li>
        <li>Keep DMs concise - Long messages get ignored.</li>
        <li>Use 'Go-To' phrases to re-engage dormant connections.</li>
        <li>Leverage your alumni network - School connections last forever.</li>
    </ul>

    <h2>When You Do Not Get a Response</h2>
    <strong>8. Handling Ghosting in Networking</strong>
    <ul>
        <li>Give them time - People get busy!</li>
        <li>Follow up in a different way - Switch from email to LinkedIn.</li>
        <li>Ask a quick question to spark a reply - "Hey, did you ever check out that event we talked about?"</li>
        <li>If they do not reply after 3 attempts, move on - Some connections are not meant to be.</li>
    </ul>

    <h2>Final Takeaways</h2>
    <ul>
        <li><strong>Networking is a marathon, not a sprint!</strong> Be consistent.</li>
        <li><strong>The fortune is in the follow-up.</strong> Stay persistent.</li>
        <li><strong>Offer value before asking for help.</strong> Build relationships naturally.</li>
        <li><strong>Your network is your net worth.</strong> Keep expanding it.</li>
    </ul>

</body>
</html>
  """;



  static const String networkingTips = r'''
**MASTERING THE ART OF NETWORKING**

- Be intentional about why you want to connect.
- Read the room - Observe body language and setting.
- Use the event context - Everyone is there to connect!
- Look approachable - Open posture, friendly demeanor.
- Practice an icebreaker - A compliment or an observation.
- Leverage group dynamics - Introduce yourself to a group.
- Approach speakers confidently - Be direct, keep it short.

**MASTERING CONVERSATIONS**

- Use the 'Intro-Compliment-Intent' formula.
- Have small talk ready - Weather, recent news, mutual contacts.
- Express gratitude - 'I appreciate you taking the time!'
- Ask thoughtful, open-ended questions - 'What inspired you to do what you do?'
- Do not just talk, listen! - Active listening builds trust.

**BUILDING STRONG CONNECTIONS**

- Do not focus on what you need - focus on adding value!
- Learn their communication style - Are they direct or casual?
- Follow their cues - If they prefer social media, connect there!
- Engage after meeting - Like or comment on their content.
- Respect their time - Keep your interactions concise.

**GETTING & STORING CONTACT INFO**

- Business cards still matter - Keep them in your wallet.
- Use LinkedIn's 'Find Nearby' feature at events.
- If they do not have a card, ask for a preferred contact method.
- Snap a picture of their business card for easy access.
- Save contacts with notes - 'Met at XYZ conference; loves AI.'

**THE ART OF FOLLOWING UP**

- Send a follow-up within 48 hours while the conversation is fresh.
- Use a personalized message - Mention something specific.
- Follow up in their preferred method (Email, LinkedIn, Text).
- Do not just say 'Let's connect' - suggest a time/place.
- Be persistent, not pushy. Follow up 2-3 times if needed.
- Offer value in follow-ups - Share an article, resource, or event.
- If they cancel, reschedule immediately. Set a new date/time.

**SCHEDULING & MAINTAINING RELATIONSHIPS**

- Track your contacts - Use a CRM, Notion, or simple spreadsheet.
- Schedule quarterly check-ins - 'Hey, hope all is well! Let's grab coffee.'
- Use social media to stay top of mind. Comment on their posts!
- Send 'thinking of you' messages. Example: 'I saw this article and thought of you!'
- Celebrate their wins. Send a congratulatory message on promotions, projects, or birthdays.
- Set networking goals. Who do you want to connect with this month?

**ADDITIONAL NETWORKING HACKS**

- Carry a book - It is an easy conversation starter.
- Find common ground quickly - Mutual friends, interests.
- Make introductions for others - Networking is about giving.
- Keep DMs concise - Long messages get ignored.
- Use 'Go-To' phrases to re-engage dormant connections.
- Leverage your alumni network - School connections last forever.

**WHEN YOU DO NOT GET A RESPONSE**

- Give them time - People get busy!
- Follow up in a different way - Switch from email to LinkedIn.
- Ask a quick question to spark a reply - 'Hey, did you ever check out that event we talked about?'
- If they do not reply after 3 attempts, move on - Some connections are not meant to be.

**FINAL TAKEAWAYS**

- Networking is a marathon, not a sprint! Be consistent.
- The fortune is in the follow-up. Stay persistent.
- Offer value before asking for help. Build relationships naturally.
- Your network is your net worth. Keep expanding it.
''';

  static const List<NextStepModel> nextSteps = [
    NextStepModel('Ignore', AppColor.nextStepIgnore),
    NextStepModel('Connect Them To Someone', AppColor.nextStepConnectSomeone),
    NextStepModel('Catch Up', AppColor.nextStepCatchUp),
    NextStepModel('Schedule Follow Up', AppColor.nextStepScheduleFollowUp),
    NextStepModel('Send Them Info', AppColor.nextStepSendThemInfo),
  ];

}