import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/bloc.dart';
import 'package:flutter_bloc_practice/main.dart';
import 'package:flutter_bloc_practice/models/models.dart';
import 'package:flutter_bloc_practice/services/product_services.dart';
import 'package:flutter_bloc_practice/services/services.dart';
import 'package:flutter_bloc_practice/ui/widgets/productcard.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/rendering.dart';


part 'main_pages.dart';
part 'home_pages.dart';
part 'signin_page.dart';
part 'signup_page.dart';
part 'mainmenu.dart';
part 'add_page.dart';
part 'data_page.dart';
part 'account_page.dart';
part 'detail_page.dart';