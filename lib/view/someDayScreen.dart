import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teux_deux_app/constant/model_constant.dart';
import 'package:teux_deux_app/model/buttonListModel.dart';
import 'package:teux_deux_app/model/todoListModel.dart';
import 'package:teux_deux_app/util/style.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:teux_deux_app/view/settingScreen.dart';
import 'package:teux_deux_app/view/todayScreen.dart';
import '../constant/screen_size_constant.dart';
import '../util/app_color.dart';
import '../widgets/custom_widgtes.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
class SomeDayScreen1 extends StatefulWidget {
  const SomeDayScreen1({Key? key}) : super(key: key);

  @override
  State<SomeDayScreen1> createState() => _SomeDayScreen1State();
}

class _SomeDayScreen1State extends State<SomeDayScreen1> {
  var appBar="SOMEDAY";
  var popWidgetText="SOMEDAY";
  TextEditingController? _eventController;
  bool isCompeleteTask=false;
  String? slidingText;
  String? todoListTitle;
  int? todoListIndex=0;
  int? moveToIndex;
  int? moveFromIndex;
  int? valueIndex;
  bool isSelected=true;
  Map<int,List<ToDoListModel>>? selectedEvent;
  Map<int,List<ToDoListModel>>? rowList;
  Map<int,List<ToDoListModel>>? columnList;
  TextEditingController addListData=TextEditingController();
  TextEditingController addSubListDate=TextEditingController();
  List<ButtonListModel> RowWidgetText=[
    ButtonListModel("SOMEDAY", false),
    ButtonListModel("GROCERY LIST", false),
    ButtonListModel("MOVIES TO WATCH", false),
    ButtonListModel("BOOKS TO READ", false),
    ButtonListModel("IDEAS", false),
  ];
  List<ButtonListModel> bodyWidgeText=[
    ButtonListModel("SOMEDAY", false),
    ButtonListModel("GROCERY LIST", false),
    ButtonListModel("MOVIES TO WATCH", false),
    ButtonListModel("BOOKS TO READ", false),
    ButtonListModel("IDEAS", false),
  ];
  int pressedAttentionIndex  = 0;
  late List<bool> pressedAttentions = RowWidgetText.map((e) => false).toList();
  String? title;
  bool activeCheck=true;
  bool activeCheck2=true;
  var rowIndex;
  List<ToDoListModel> _getEventFromList(int index){
    return selectedEvent![index] ?? [];
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedEvent={};
  }
  @override
  Widget build(BuildContext context) {
    ScreenSize.height=MediaQuery.of(context).size.height;
    ScreenSize.width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: AppColors.backGroundColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: AppColors.backGroundColor,
              title: Text(appBar,style: navigationBarButtonStyle(),),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton
                    (onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>SettingScreen()));
                  },
                    icon: Icon(Icons.settings,size: 20,color: Colors.white70,),),
                ),
              ],
            ),
            body: Stack(
              children: [
                Container(
                    child:listTile(),
                ),
                SlidingUpPanel(
                  maxHeight: ScreenSize.height!,
                  minHeight: 90,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(0),topLeft:  Radius.circular(0)),
                  color: AppColors.lightGreyColor,
                  panel: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: ScreenSize.height!*0.009,),
                      Container(
                          height: ScreenSize.height!*0.10,
                          width: ScreenSize.width,
                          child:ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index)
                              {
                                final pressAttention = pressedAttentionIndex == index;
                                return GestureDetector(
                                  child: Chip(
                                    backgroundColor: pressAttention ? Colors.black:AppColors.lightGreyColor,
                                    padding: EdgeInsets.all(12),
                                    label: Text(RowWidgetText[index].title!,style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                    ),),),
                                  onTap: (){
                                  setState(() {
                                    todoListIndex=index;
                                    pressedAttentionIndex = index;
                                    moveFromIndex=index;
                                    showDataInContainer(index,selectedEvent!);
                                  });
                                  },
                                );
                              },
                              separatorBuilder: (context,index)
                              {
                                return SizedBox(width: 20,);
                              },
                              itemCount: RowWidgetText.length
                          )
                      ),
                      SizedBox(height: ScreenSize.height!*0.05,),
                      Container(
                        height: ScreenSize.height!*0.5,
                        width: ScreenSize.width,
                        child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context,index)
                            {
                              return GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                                  child: Text(bodyWidgeText[index].title!,style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),),
                                ),
                                onTap: (){
                                  setState(() {
                                    todoListIndex=index;
                                    pressedAttentionIndex = index;
                                    moveFromIndex=index;
                                    showDataInContainer(index,selectedEvent!);
                                    rowIndex=index;
                                  });

                                },
                              );
                            },
                            separatorBuilder: (context,index)
                            {
                              return SizedBox(height: 15,);
                            },
                            itemCount: bodyWidgeText.length
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            showDialog(context: context, builder: (context) =>AlertDialog(
                              title: Center(child: Text("$appBar")),
                              content: TextField(controller: _eventController,
                                onChanged: (value)
                                {
                                  slidingText=value;
                                },),
                              actions: [
                                TextButton(
                                    onPressed: (){
                                      if(slidingText!.isEmpty)
                                      {

                                      }
                                      else{
                                        if(RowWidgetText != null || bodyWidgeText != null)
                                        {
                                          RowWidgetText.add(ButtonListModel(slidingText, false));
                                          bodyWidgeText.insert(0,ButtonListModel(slidingText,false));
                                        }
                                      }
                                      Navigator.pop(context);
                                      setState(() {});
                                      return;
                                    },
                                    child:Text("Ok",style: TextStyle(
                                        color: Colors.white
                                    ),)
                                ),
                                TextButton(onPressed: ()=>Navigator.pop(context), child:Text("Cancel",style: TextStyle(
                                    color: Colors.white
                                ),)),
                              ],
                            )
                            );
                          },
                          child: Text("+ADD",style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),),
                        ),
                      ),
                    ],),),
              ],
            ),
            floatingActionButton:FloatingActionButton(
              backgroundColor: AppColors.darkGreyColor,
              onPressed:() {
                showDialog(context: context, builder: (context) =>SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: AlertDialog(
                    title: Center(child: Text("$appBar")),
                    content: TextField(controller: _eventController,
                      onChanged: (value)
                      {
                        todoListTitle=value;
                      },),
                    actions: [
                      TextButton(
                          onPressed: (){
                            if(todoListTitle!.isEmpty)
                            {

                            }
                            else{
                              if(selectedEvent ![todoListIndex] != null)
                              {
                                selectedEvent![todoListIndex]?.add(ToDoListModel(
                                    title: todoListTitle,isCompelete: false
                                ));
                              }
                              else{
                                selectedEvent![todoListIndex!]=[
                                  ToDoListModel(title: todoListTitle,isCompelete: false),
                                ];
                              }
                            }
                            Navigator.pop(context);
                            setState(() {});
                            return;
                          },
                          child:Text("Ok",style: TextStyle(
                              color: Colors.white
                          ),)
                      ),
                      TextButton(onPressed: ()=>Navigator.pop(context), child:Text("Cancel",style: TextStyle(
                          color: Colors.white
                      ),)),
                    ],
                  ),
                )
                );
              },
              tooltip: 'Add',
              child: Icon(Icons.add,size: 20,color: Colors.white,),
            ),
            bottomNavigationBar:bottomNavigationBar(),
          ),

        ],
      ),
    );
  }
  Widget bottomNavigationBar(){
    Orientation orientation=MediaQuery.of(context).orientation;
    if(orientation==Orientation.portrait) {
      return Container(
          decoration: BoxDecoration(
              color: AppColors.darkGreyColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0))
          ),
          height: ScreenSize.height! * 0.10,
          width: ScreenSize.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 20, top: 10),
                child: Column(
                  children: [
                    navigationBarButton(
                        function: () {
                          setState(() {
                            activeCheck = !activeCheck;
                          });
                          todayTextButton();
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Calendear()));
                        }, text: 'TODAY'),
                    SizedBox(height: ScreenSize.width! * 0.01,),
                    activeCheck1(activeCheck),
                  ],
                ),
              ),
              SizedBox(width: ScreenSize.width! * 0.52,),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 20, top: 10),
                child: Column(
                  children: [
                    navigationBarButton(function: () {
                      activeCheck2 = !activeCheck2;
                      someDayTextButton();
                    }, text: 'SOMEDAY'),
                    SizedBox(height: ScreenSize.width! * 0.01,),
                    activeCheck1(activeCheck2),
                  ],
                ),
              ),
            ],
            //   ),
          )
      );
    }
    else{
      return Container(
          decoration: BoxDecoration(
              color: AppColors.darkGreyColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0))
          ),
          height: ScreenSize.height! * 0.20,
          width: ScreenSize.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 20, top: 10),
                child: Column(
                  children: [
                    navigationBarButton(
                        function: () {
                          setState(() {
                            activeCheck = !activeCheck;
                          });
                          todayTextButton();
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Calendear()));
                        }, text: 'TODAY'),
                    SizedBox(height: ScreenSize.width! * 0.01,),
                    activeCheck1(activeCheck),
                  ],
                ),
              ),
              SizedBox(width: ScreenSize.width! * 0.52,),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 20, top: 10),
                child: Column(
                  children: [
                    navigationBarButton(function: () {
                      activeCheck2 = !activeCheck2;
                      someDayTextButton();
                    }, text: 'SOMEDAY'),
                    SizedBox(height: ScreenSize.width! * 0.01,),
                    activeCheck1(activeCheck2),
                  ],
                ),
              ),
            ],
            //   ),
          )
      );
    }
  }
  Widget activeCheck1(bool check)
  {
    if(check == true)
    {
      return Icon(Icons.circle,size: 5,color: Colors.transparent,); ;
    }
    else{
      return Icon(Icons.circle,size: 5,color: Colors.white,);
    }
  }
  void todayTextButton() {}

  void someDayTextButton() {}

  void customDragSheetButtonAction() {}

  void checkButton() {}
  Future showPopUp(Widget abc) async {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        backgroundColor: AppColors.backGroundColor,
        enableDrag: false,
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (context) =>abc);
  }
  Widget addData()
  {
    return Container(
      height: ScreenSize.height!*0.8,
      decoration: BoxDecoration(
        // color: Colors.grey.withOpacity(0.4)
      ),
      padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.clear,color: Colors.white70,size:25,),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },),
                SizedBox(width: ScreenSize.width!*0.17,),
                Text(popWidgetText,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white70
                ),),
                SizedBox(width: ScreenSize.width!*0.17,),
                IconButton(
                  icon: Icon(Icons.check,size: 25,color: Colors.white70,),
                  onPressed: (){
                      if(todoListTitle!.isEmpty)
                        {

                        }
                      else{
                        if(selectedEvent![todoListIndex] != null)
                        {
                          selectedEvent![todoListIndex]?.add(ToDoListModel(
                              title: todoListTitle,isCompelete: false
                          ));
                        }
                        else{
                          selectedEvent![todoListIndex!]=[
                            ToDoListModel(title: todoListTitle,isCompelete: false),
                          ];
                        }
                      }
                      Navigator.of(context).pop();
                      setState(() {});
                      return;
                  },)
              ],
            ),
          ),
          SizedBox(height: ScreenSize.height!*0.03,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(),
            ),
            child: TextField(
              autofocus: true,
              controller:addListData,
              onSubmitted: (value){
                setState(() {
                  title=value;
                  todoListTitle=value;
                });
                addListData.clear();
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }

  void closeScreen() {
    Navigator.of(context).pop();
  }
  Widget listTile()
  {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ReorderableListView.builder(
          itemCount: _getEventFromList(todoListIndex!).length,
          shrinkWrap: true,
          onReorder: (oldIndex, newIndex) => setState(() {
            final index=newIndex>oldIndex ? newIndex-1:newIndex;
            final user=selectedEvent![todoListIndex]?.removeAt(oldIndex);
            selectedEvent![todoListIndex]?.insert(index,user!);

          }),
          itemBuilder: (BuildContext context,int index){
            return Slidable(
              key: UniqueKey(),

              // The start action pane is the one at the left or the top side.
              startActionPane: ActionPane(
                // A motion is a widget used to control how the pane animates.
                motion: ScrollMotion(),

                // A pane can dismiss the Slidable.
                // dismissible: DismissiblePane(onDismissed: () {
                //
                // }),
                children: [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                    onPressed: (context){
                      setState(() {
                        selectedEvent![todoListIndex]?.removeAt(index);
                      });
                    },
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: (context){
                      setState(() {
                        showPopUp(onMove());
                        valueIndex=index;
                      });
                    },
                    backgroundColor: Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.move_to_inbox,
                    label: 'Move',
                  ),
                ],
              ),
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) async{
                      edit(index);
                    },
                    backgroundColor: Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'Edit',
                  ),
                ],
              ),
              child: ListTile(
                key: UniqueKey(),
                title:Text(_getEventFromList(todoListIndex!)[index].title!,style: _getTextStyle(_getEventFromList(todoListIndex!)[index].isCompelete!),),
                onTap: (){
              setState(() {
                isCompeleteTask=!isCompeleteTask;
                selectedEvent![todoListIndex]![index]=ToDoListModel(title:_getEventFromList(todoListIndex!)[index].title!,isCompelete: isCompeleteTask);
              });
                },
              )
            );
          }
      ),
    );
  }
  void doNothing(BuildContext context) {}

  void showDataInContainer(int index, Map<int, List<ToDoListModel>> myMap) {
    try {

      setState(() {
        todoListIndex=index;
        appBar = RowWidgetText[index].title!;
        popWidgetText = RowWidgetText[index].title!;
      });
    }
    catch(e)
    {
      print(e.toString());
    }
  }
  Widget onMove()
  {
    return Container(
        height: ScreenSize.height!*0.70,
        width: ScreenSize.width!*0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child:ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (context,index)
            {
              return InkWell(
                 child:Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                   child: Text(RowWidgetText[index].title!,style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),
                 ),
                onTap: (){
                  setState(() {
                    (RowWidgetText[index].isSelected!)==!(RowWidgetText[index].isSelected!);
                    moveToIndex=index;
                    // Navigator.of(context).pop();
                  });
                  moveToMethod(moveToIndex!, moveFromIndex!,valueIndex!);
                },
              );
            },
            separatorBuilder: (context,index)
            {
              return SizedBox(height: 30,);
            },
            itemCount: RowWidgetText.length
        )
    );
  }

  void moveToMethod(int moveToIndex,int moveFromIndex,int valueIndex) {
    var moveFromlist = selectedEvent![moveFromIndex];
    var moveTolist = selectedEvent![moveToIndex];
    setState(() {
      moveTolist?.add(moveFromlist![valueIndex]);
      moveFromlist?.removeAt(valueIndex);
    });
  }

  void edit(int index) {
    showDialog(context: context, builder: (context) =>SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: AlertDialog(
        title: Center(child: Text("$appBar")),
        content: TextFormField(
          initialValue: selectedEvent![todoListIndex]![index].title!,
          controller: _eventController,
          onChanged: (value)
          {
            setState(() {
              selectedEvent![todoListIndex]![index]=ToDoListModel(title: value,isCompelete: false);
            });
          },),

        actions: [
          TextButton(
              onPressed: (){
                Navigator.of(context).pop();
                },
              child:Text("Ok",style: TextStyle(
                color: Colors.white
              ),)
          ),
          TextButton(onPressed: ()=>Navigator.pop(context), child:Text("Cancel",style: TextStyle(
      color: Colors.white
      ),)),
        ],
      ),
    )
    );

  }
  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }
}
