import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hey_follow_up/util/constants.dart';
import '../../../util/color_scheme.dart';

class ConversationTip extends StatelessWidget {
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ConversationTip(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.kScaffoldBackgroundColor,
        body: Column(
          children: [
            _buildTopOtpScreen(context),
            _buildRemainingAuthScreen(context),
          ],
        ));
  }

  Widget _buildTopOtpScreen(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Conversation Tips',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Below are some tips to help you have a smooth and healthy conversation.',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemainingAuthScreen(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
        child: SingleChildScrollView(
          child: MarkdownBody(
            data: Constants.networkingTips,
            styleSheet: MarkdownStyleSheet(
              h2: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              p: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
