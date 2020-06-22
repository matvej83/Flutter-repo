import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/model/postUser.dart';

import 'bloc/custom_bloc.dart';

class CounterTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(10),
                  child: RaisedButton(
                    color: Colors.greenAccent, // Цвет кнопки.
                    textColor: Colors.black,
                    onPressed: () {
                      BlocProvider.of<CustomBlocBloc>(context)
                          .add(DataManager());
                    },
                    child: Text("Get data"),
                  )),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: BlocBuilder<CustomBlocBloc, CustomBlocState>(
                    builder: (context, state) {
                      if (state is CustomState) {
                        return getData(context, state.listPostUsers);
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getData(context, PostUsers listPostUsers) {
    return Scrollbar(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        itemCount: listPostUsers.postUsers.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.assignment_turned_in),
            title: Text('id= ' + '${listPostUsers.postUsers[index].id}'),
            subtitle: Text('userId= ' +
                '${listPostUsers.postUsers[index].userId}' +
                '\ntitle= ' +
                '${listPostUsers.postUsers[index].title}' +
                '\nbody= ' +
                '${listPostUsers.postUsers[index].body}'),
          );
        },
      ),
    );
  }
}
