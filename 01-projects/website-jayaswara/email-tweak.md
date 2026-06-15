Website: jayaswara.in

Issue:
Contact form emails were arriving in Spam.

Root Cause:
Active file ContactFormWidget.php used:

info@jayaswara.in

as the From address.

That mailbox did not exist.

Resolution:
Changed:

info@

to

rajeev@

Result:
Emails now arrive directly in Inbox.

Date:
15 June 2026