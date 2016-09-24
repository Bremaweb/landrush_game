Minetest News
-------------

News that pops up in a formspec when a player joins the server.

Create a text file called news.txt in the world folder.

This text file can be updated any time and will always be current in game without a server reboot

To add extra articles just create a text file for each article in the world folder in the format

news_[article name].txt

(i.e. news_crafting.txt would show an article for the command /news crafting)


This version shows pops up if news.txt was changed since last log on.

This modification is still bit rough as it needs cronjob which will be generating md5 hash of news.txt
into file called news.txt.md5 . Without that file, script will crash.

example cron line:

* *  * * *   user   md5sum /path/to/news.txt > /path/to/news.txt.md5

As I don't use windows, I will not provide information how to do so on windows.