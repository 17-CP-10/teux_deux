import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:teux_deux_app/constant/screen_size_constant.dart';
import 'package:teux_deux_app/model/todoListModel.dart';
import 'package:teux_deux_app/view/settingScreen.dart';
import 'package:teux_deux_app/view/someDayScreen.dart';
import '../constant/model_constant.dart';
import '../util/app_color.dart';
import '../widgets/custom_widgtes.dart';

class Calendear extends StatefulWidget {
  const Calendear({Key? key}) : super(key: key);

  @override
  State<Calendear> createState() => _CalendearState();
}

class _CalendearState extends State<Calendear> {
  String title='';
  String appBar="";
  int? len=1;
  bool activeCheck=true;
  bool activeCheck2=true;
  bool isCompeleteTask=false;
  int? valueIndex;
  Map<DateTime,List<ToDoListModel>>? selectedEvent;
  TextEditingController? _eventController;
  DateTime _focusDay=DateTime.now();
  DatePickerController _controller = DatePickerController();
  DateTime _selectDay=DateTime.now();
  DateTime _moveToSelectDay=DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedEvent={};
    appBar=DateFormat.MMMMEEEEd().format(_focusDay);
  }
  List<ToDoListModel> _getEventFromDay(DateTime date){
    return selectedEvent![date] ?? [];
  }
  @override
  void dispose(){
    _eventController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    ScreenSize.height=MediaQuery.of(context).size.height;
    ScreenSize.width=MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColors.backGroundColor,
        title: Text("$appBar"),
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
      body:Stack(
        children: [
          buildListTile(),
          // Container(child: buildListTile()),
          SlidingUpPanel(
              maxHeight: ScreenSize.height!,
              minHeight: 90,
              borderRadius: BorderRadius.only(topRight: Radius.circular(0),topLeft:  Radius.circular(0)),
              color: MyConstant.allcolor,
              panel: Column(
                children: [
                  rowDatePicker(),
                  buildCalender(CalendarFormat.month),
                ],
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyConstant.allcolor,
        onPressed: (){
        showDialog(context: context, builder: (context) =>SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: AlertDialog(
            title: Center(child: Text("$appBar")),
            content: TextField(controller: _eventController,
              onChanged: (value)
              {
                title=value;
              },),
            actions: [
              TextButton(
                  onPressed: (){
                    if(title.isEmpty)
                    {

                    }
                    else{
                      if(selectedEvent![_selectDay] != null)
                      {
                        selectedEvent![_selectDay]?.insert(0,ToDoListModel(
                            title: title,isCompelete: false
                        ));
                        setState(() {
                          len=selectedEvent![_selectDay]!.length;
                        });
                      }
                      else{
                        selectedEvent![_selectDay]=[
                          ToDoListModel(title: title,isCompelete: false),
                        ];
                      }
                    }
                    Navigator.pop(context);
                    // _eventController!.clear();
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
        ),
        );
      },
        tooltip: 'Add',
        child: Icon(Icons.add,size: 20,color: Colors.white,),
      ),
      bottomNavigationBar:buildBottomNavigationOrientation(),
    );
  }
  Widget buildBottomNavigationOrientation(){
   Orientation orientation=MediaQuery.of(context).orientation;
   if(orientation==Orientation.portrait)
     {
       return Container(
           decoration: BoxDecoration(
               color: MyConstant.allcolor,
               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0),bottomRight: Radius.circular(0))
           ),
           height: ScreenSize.height!*0.10,
           width: ScreenSize.width,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Padding(
                 padding: const EdgeInsets.only(left: 15,bottom: 20,top: 10),
                 child: Column(
                   children: [
                     navigationBarButton(
                         function:(){
                           setState(() {
                             activeCheck=!activeCheck;
                           });
                           todayTextButton();
                           Navigator.push(context, MaterialPageRoute(
                               builder: (context) =>Calendear()));
                         },text: 'TODAY'),
                     SizedBox(height: ScreenSize.width!*0.01,),
                     activeCheck1(activeCheck),
                   ],
                 ),
               ),
               SizedBox(width:ScreenSize.width!*0.52 ,),
               Padding(
                 padding: const EdgeInsets.only(left: 15,bottom: 30,top: 10),
                 child: Column(
                   children: [
                     navigationBarButton(function:(){
                       activeCheck2=!activeCheck2;
                       someDayTextButton();
                       Navigator.push(context, MaterialPageRoute(
                           builder: (context) =>SomeDayScreen1()));
                     },text: 'SOMEDAY'),
                     SizedBox(height: ScreenSize.width!*0.01,),
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
             color: MyConstant.allcolor,
             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0),bottomRight: Radius.circular(0))
         ),
         height: ScreenSize.height!*0.18,
         width: ScreenSize.width,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Padding(
               padding: const EdgeInsets.only(left: 15,bottom: 20,top: 10),
               child: Column(
                 children: [
                   navigationBarButton(
                       function:(){
                         setState(() {
                           activeCheck=!activeCheck;
                         });
                         todayTextButton();
                         Navigator.push(context, MaterialPageRoute(
                             builder: (context) =>Calendear()));
                       },text: 'TODAY'),
                   SizedBox(height: ScreenSize.width!*0.01,),
                   activeCheck1(activeCheck),
                 ],
               ),
             ),
             SizedBox(width:ScreenSize.width!*0.52 ,),
             Padding(
               padding: const EdgeInsets.only(left: 15,bottom: 20,top: 10),
               child: Column(
                 children: [
                   navigationBarButton(function:(){
                     activeCheck2=!activeCheck2;
                     someDayTextButton();
                     Navigator.push(context, MaterialPageRoute(
                         builder: (context) =>SomeDayScreen1()));
                   },text: 'SOMEDAY'),
                   SizedBox(height: ScreenSize.width!*0.01,),
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
  void doNothing(BuildContext context) {}
  Widget buildListTile(){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ReorderableListView.builder(
          shrinkWrap: true,
          itemCount:_getEventFromDay(_selectDay).length,
          onReorder: (oldIndex, newIndex){
            setState(() {
              final nIndex=newIndex>oldIndex ? newIndex-1:newIndex;
              final user=selectedEvent![_selectDay]?.removeAt(oldIndex);
              selectedEvent![_selectDay]?.insert(nIndex,user!);
            });
          },
          itemBuilder: (BuildContext context,int index){
            return Slidable(
              // Specify a key if the Slidable is dismissible.
                key: UniqueKey(),

                // The start action pane is the one at the left or the top side.
                startActionPane: ActionPane(
                  // A motion is a widget used to control how the pane animates.
                  motion: ScrollMotion(),

                  // A pane can dismiss the Slidable.
                  // dismissible: DismissiblePane(onDismissed: () {}),

                  // All actions are defined in the children parameter.
                  children: [
                    // A SlidableAction can have an icon and/or a label.
                    SlidableAction(
                      onPressed: (context){
                        setState(() {
                          selectedEvent![_selectDay]?.removeAt(index);
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
                          showPopUp(CalendarFormat.month);
                          valueIndex=index;
                        });
                      },
                      backgroundColor: Color(0xFF21B7CA),
                      foregroundColor: Colors.white,
                      icon: Icons.move_to_inbox,
                      label: 'Move',
                    ),
                  ],
                ),

                // The end action pane is the one at the right or the bottom side.
                endActionPane:ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      // An action can be bigger than the others.
                      flex: 2,
                      onPressed: (context){
                        edit(index);
                      },
                      backgroundColor: Color(0xFF7BC043),
                      foregroundColor: Colors.white,
                      icon: Icons.edit,
                      label: 'Edit',
                    ),
                    SlidableAction(
                      onPressed: doNothing,
                      backgroundColor: Color(0xFF0392CF),
                      foregroundColor: Colors.white,
                      icon: Icons.save,
                      label: 'Save',
                    ),
                  ],
                ),

                // The child of the Slidable is what the user sees when the
                // component is not dragged.
                child: ListTile(
                  key: UniqueKey(),
                  title: Text(_getEventFromDay(_selectDay)[index].title!,style: _getTextStyle(_getEventFromDay(_selectDay)[index].isCompelete!),),
                  onTap: (){
                    var newIndex=selectedEvent![_selectDay]?.length;
                    setState(() {
                      isCompeleteTask=!isCompeleteTask;
                      selectedEvent![_selectDay]![index]=ToDoListModel(title:_getEventFromDay(_selectDay)[index].title!,isCompelete: isCompeleteTask);
                    });
                    if(isCompeleteTask==false)
                      {

                      }
                    else{
         setState(() {
           final nIndex=newIndex!>index ? newIndex-1:newIndex;
           final user=selectedEvent![_selectDay]?.removeAt(index);
           selectedEvent![_selectDay]?.insert(nIndex,user!);
         });
                    }
                  },
                )
            );
          }),
    );
  }

  Widget buildCalender(CalendarFormat format ){
    return TableCalendar(
      lastDay: DateTime(2060),
      focusedDay: _focusDay,
      firstDay: DateTime(1990),
      calendarFormat: format,
      onFormatChanged: (CalendarFormat _format)
      {
        setState(() {
          format=_format;
        });
      },
      startingDayOfWeek: StartingDayOfWeek.monday,
      daysOfWeekVisible: true,

      onDaySelected: (DateTime selectDay,DateTime focusDay)
      {
        setState(() {
          appBar=DateFormat.MMMMEEEEd().format(selectDay);
          _selectDay=selectDay;
          _focusDay!=focusDay;
        });
      },
      calendarStyle: CalendarStyle(
          isTodayHighlighted: true,
          selectedDecoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle
          ),
          selectedTextStyle: TextStyle(
              color: Colors.white
          ),
          todayDecoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle
          )
      ),
      headerStyle: HeaderStyle(
          formatButtonVisible: false,
          leftChevronVisible: false,
          rightChevronVisible: false,
          headerPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10)
      ),
      selectedDayPredicate: (DateTime date)
      {
        return isSameDay(_selectDay,date);
      },
      eventLoader: _getEventFromDay,
    );
  }
  Widget rowDatePicker()
  {
    return DatePicker(
      _focusDay,
      width: 60,
      height: 80,
      controller: _controller,
      initialSelectedDate: DateTime.now(),
      selectionColor: Colors.black,
      selectedTextColor: Colors.white,
      onDateChange: (date) {
        // New date selected
        setState(() {
         appBar=DateFormat.MMMMEEEEd().format(date);
          _selectDay = date;
        });
      },
    );
  }
  Future showPopUp(CalendarFormat format) async {
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
        builder: (context) =>StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return TableCalendar(
              lastDay: DateTime(2060),
              focusedDay: _focusDay,
              firstDay: DateTime(1990),
              calendarFormat: format,
              onFormatChanged: (CalendarFormat _format)
              {
                setState(() {
                  format=_format;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.monday,
              daysOfWeekVisible: true,

              onDaySelected: (DateTime selectDay,DateTime focusDay)
              {
                setState(() {
                  _moveToSelectDay=selectDay;
                  _focusDay!=focusDay;

                });
                moveToMethod(_moveToSelectDay,_selectDay,valueIndex!);
                Navigator.of(context).pop();
              },

              calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle
                  ),
                  selectedTextStyle: TextStyle(
                      color: Colors.white
                  ),
                  todayDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle
                  )
              ),
              headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  leftChevronVisible: false,
                  rightChevronVisible: false,
                  headerPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10)
              ),
              selectedDayPredicate: (DateTime date)
              {
                return isSameDay(_moveToSelectDay,date);
              },
              eventLoader: _getEventFromDay,
            );
          },

        ));
  }
  void moveToMethod(DateTime moveToIndex,DateTime moveFromIndex,int valueIndex) {
    print(moveToIndex);
    setState(() {
      final user=selectedEvent![moveFromIndex]?.removeAt(valueIndex);
      selectedEvent![moveFromIndex]?.add(user!);
    });
  }

  void someDayTextButton() {}
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
  void edit(int index) {
    showDialog(context: context, builder: (context) =>SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: AlertDialog(
        title: Center(child: Text("$appBar")),
        content: TextFormField(
          initialValue: selectedEvent![_selectDay]![index].title!,
          controller: _eventController,
          onChanged: (value)
          {
            setState(() {
              selectedEvent![_selectDay]![index]=ToDoListModel(title: value,isCompelete: false);
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
    );}
  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }
}
