import 'package:flutter/material.dart';

class ItemPlaylist extends StatelessWidget {
  const ItemPlaylist({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            SizedBox(
                height: 60,
                width: 60,
                child: Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtxlYfebAseJ4rO-GM4Ke4GJEB0C0-84Avd7LyI-O8-w&s'), fit: BoxFit.fill,)
            ),
            SizedBox(width: 8,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nhạc chill chill mỗi ngày", style: TextStyle(
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16
                  ),),
                  Text('1 bài bát', style: TextStyle(
                    color: Colors.white38,
                    fontSize: 12
                  ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
