
```
Padding(

padding: const EdgeInsets.all(15.0),

child: Column(

children: <Widget>[

Container(

margin: EdgeInsets.only(top: screenSize.height * 0.025),

child: LinearPercentIndicator(

center: const Text(

'Food',

style: TextStyle(

fontSize: 16.0,

fontWeight: FontWeight.bold,

),

),

lineHeight: screenSize.height * 0.05,

percent: 0.2,

progressColor: CupertinoColors.systemYellow,

barRadius: const Radius.circular(8.0),

),

),

Container(

margin: EdgeInsets.only(top: screenSize.height * 0.025),

child: LinearPercentIndicator(

center: const Text(

'Entertainment',

style: TextStyle(

fontSize: 16.0,

fontWeight: FontWeight.bold,

),

),

lineHeight: screenSize.height * 0.05,

percent: 0.5,

progressColor: CupertinoColors.systemIndigo,

barRadius: const Radius.circular(8.0),

),

),

Container(

margin: EdgeInsets.only(top: screenSize.height * 0.025),

child: LinearPercentIndicator(

center: const Text(

'Transport',

style: TextStyle(

fontSize: 16.0,

fontWeight: FontWeight.bold,

),

),

lineHeight: screenSize.height * 0.05,

percent: 0.9,

progressColor: CupertinoColors.systemMint,

barRadius: const Radius.circular(8.0),

),

)

],

),

),
```