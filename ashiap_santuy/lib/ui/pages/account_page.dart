part of 'pages.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isLoading = false;
  void initState() {
    super.initState();
    GetUserData.getCurrentUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("My Account"),
          leading: Container(),
        ),
        body: Stack(children: [
          Container(
            margin: EdgeInsets.only(left: 32, top: 24),
            width: MediaQuery.of(context).size.width-64,
            height: MediaQuery.of(context).size.height/1.7,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(3, 5), blurRadius: 30)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 24),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1464983308776-3c7215084895?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
                        ),
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  child: RaisedButton.icon(
                    icon: Icon(
                      Icons.camera,
                    ),
                    label: Text("Edit Photo"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    color: Colors.lightBlue,
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  child: Text(
                    username,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  child: Text(
                    email,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
          isLoading == true
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                  child: SpinKitFadingCircle(
                    size: 50,
                    color: Colors.blue,
                  ))
              : Container(),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 16),
                width: 100,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Signout Connfirmation"),
                            content: Text("Are you sure to signout?"),
                            actions: [
                              FlatButton(
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await AuthServices.signOut().then((value) {
                                    if (value) {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return SignInPage();
                                      }));
                                      setState(() {
                                        isLoading = false;
                                      });
                                    } else {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  });
                                },
                                child: Text("Yes"),
                              ),
                              FlatButton(
                                child: Text("No"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        });
                  },
                  padding: EdgeInsets.all(12),
                  textColor: Colors.white,
                  color: Colors.red,
                  child: Text("Sign Out"),
                ),
              ),
            ),
          ),
        ]));
  }
}
