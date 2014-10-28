ios-table-scroll-bug
====================

iOS project showing a weird scrolling bug while changing auto layout constraints


1. open the project
2. the table starts with a Top Space constraint to its superview starting at 280
3. as you scroll the table up, the constraint is lowered until it hits the top of the screen
4. during the time when the top constraint is between 280 and 0, it's scrolling ~2x faster than normal

WHY????