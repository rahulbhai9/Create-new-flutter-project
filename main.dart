import 'package:flutter/material.dart';
void main() => runApp(ChessApp());
class ChessApp extends StatelessWidget {  
@override  
Widget build(BuildContext context) {    
return MaterialApp(      
title: 'Accessible Chess Board',      
theme: ThemeData(        
primarySwatch: Colors.blue,
      ),      
home: ChessBoard(),
    );
  }
}
class ChessBoard extends StatefulWidget {  
@override  
_ChessBoardState createState() => _ChessBoardState();
}
class _ChessBoardState extends State<ChessBoard> {  
String? selectedSquare;  
Map<String, String> boardState = {    
'a1': 'White rook', 'b1': 'White knight', 'c1': 'White bishop', 'd1': 'White queen', 'e1': 'White king', 'f1': 'White bishop', 'g1': 'White knight', 'h1': 'White rook',    
'a2': 'White pawn', 'b2': 'White pawn', 'c2': 'White pawn', 'd2': 'White pawn', 'e2': 'White pawn', 'f2': 'White pawn', 'g2': 'White pawn', 'h2': 'White pawn',    
'a7': 'Black pawn', 'b7': 'Black pawn', 'c7': 'Black pawn', 'd7': 'Black pawn', 'e7': 'Black pawn', 'f7': 'Black pawn', 'g7': 'Black pawn', 'h7': 'Black pawn',    
'a8': 'Black rook', 'b8': 'Black knight', 'c8': 'Black bishop', 'd8': 'Black queen', 'e8': 'Black king', 'f8': 'Black bishop', 'g8': 'Black knight', 'h8': 'Black rook'
  };
  @override  
Widget build(BuildContext context) {    
return Scaffold(      
appBar: AppBar(        
title: Text('Accessible Chess Board'),
      ),      
body: GridView.builder(        
gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(          
crossAxisCount: 8,
        ),        
itemCount: 64,        
itemBuilder: (context, index) {          
final int row = index ~/ 8;          
final int col = index % 8;          
final String square = '${String.fromCharCode(97 + col)}${8 - row}';          
final String label = selectedSquare == square              
? 'Selected $square, ${boardState[square] ?? "No piece"}'
              : '$square, ${boardState[square] ?? "No piece"}';
          return GestureDetector(            
onTap: () {              
setState(() {                
if (selectedSquare == null) {                  
selectedSquare = square;
                } else {                  
// Implement the move logic here                  
print('Move from $selectedSquare to $square');                  
selectedSquare = null;
                }
              });
            },            
child: Container(              
decoration: BoxDecoration(                
color: (row + col) % 2 == 0 ? Colors.white : Colors.grey,
              ),              
child: Center(                
child: Semantics(                  
label: label,                  
child: Text(                    
boardState[square] != null                        
? boardState[square]![0]
                        : '',                    
style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }