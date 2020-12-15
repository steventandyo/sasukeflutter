part of "pages.dart";

class HomePage extends StatelessWidget {

  final ctrlName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dengan Bloc"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<TextlabelBloc, TextlabelState>(
              
              builder: (context, changeTextLabelState) => Text(
                changeTextLabelState.value.toString(), 
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),)
              ),
            SizedBox(height: 24),
            TextFormField(
              controller: ctrlName,
              decoration: InputDecoration(
                hintText: "Your Full Name",
                labelText: "Full Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24,),
            RaisedButton.icon(
              textColor: Colors.white,
              color: Colors.blue[600],
              icon: Icon(Icons.add_box), 
              label: Text("Submit"),
              onPressed: (){
                context.bloc<TextlabelBloc>().add(ChangeTextLabel(ctrlName.text));
              },
            )
          ],
        ),
      ),
    );
  }
}