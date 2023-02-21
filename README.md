Sending mail via automated service (such as sendmail) is not working anymore with Gmail. So I plan to write the script to send the automated email from thunderbird. And update contents of each sending mail as well.

- First, need to install thunderbird.
  - https://www.thunderbird.net/en-US/

- login with your mail account that you would like to send mail from.

- there have two files that the script need.

  - maillist.txt : In this case, I have to track which users are clicking. So I made with this format (email:tracker). You can adjust for your own case.
  - template.html : this is the body message. I have to update for some parts of the body message based on the recipient name. So I implement iteration and replace the string every round. and replace the original value back after the operation is complete.

- I used some of the thunderbird cli arguments. You can read the full documentation here: http://kb.mozillazine.org/Command_line_arguments_-_Thunderbird

  - compose : open new compose windows
  - preselectid : an identifier for the "From" identity to choose from the menu
  - to : recipient
  - subject : mail subject
  - message :  specify a plain text or an HTML file with UTF-8 encoding for the body of the mail

- Adjust the time sleep values and replace value as you need.

  

  Cheers!
