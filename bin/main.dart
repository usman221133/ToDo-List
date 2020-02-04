import 'dart:io';

void main() {
  mainMenu();

  var toDoList = new List<String>();
  var input = stdin.readLineSync();
  var optionNumber = int.tryParse(input) ?? -1;

  do{
    switch(optionNumber)
    {
      case 1:
        printList(toDoList);

        optionList(toDoList);

        print(Process.runSync("clear", [], runInShell: true).stdout);

        mainMenu();
        break;
      case 2:
        print('Please enter any value to add to TODO LIST');
        var todoName = stdin.readLineSync();
        toDoList.add(todoName);
        break;
      case 3:
        print('Clearing the TODO LIST...');
        toDoList.clear();
        print('TODO LIST cleared...');
        break;
      case 4:
        exit(0);
        break;
      default:
        print('Invalid input provided');
        break;
    }

    input= stdin.readLineSync();
    optionNumber = int.tryParse(input) ?? -1;
  }
  while(optionNumber != 4);
}

void mainMenu(){
  print('======== TODO LIST =========');
  print('Press 1 for TODO LIST');
  print('Press 2 to ADD TODOS');
  print('Press 3 to Clear All TODOS');
  print('Press 4 to exit\n');
}

void printList(List<String> toDoList){
  print('======== LIST =========');
  if(toDoList.length == 0){
    print('\t Empty');
  }
  else{
    for(var i=0;i<toDoList.length; i++){
      print((i+1).toString()+': '+toDoList[i]);
    }
  }
  print('======== END OF LIST =========');
  print('Press 1 for Edit');
  print('Press 2 for Delete');
  print('Press 3 to return to Main Menu');
}

void optionList(List<String> toDoList){
  var listOption = int.tryParse(stdin.readLineSync()) ?? -1;
  do{
    switch(listOption){
      case 1:
        print('Press id from list to Edit');
        editElement(toDoList);
        break;
      case 2:
        print('Press id from list to delete');
        deleteElement(toDoList);
        break;
      case 3:
        break;
        default:
          print ('Invalid Value');
          break;
    }
    listOption = int.tryParse(stdin.readLineSync()) ?? -1;
  }while(listOption != 3);
}

void deleteElement(List<String> toDoList) {
  var deleteId = int.tryParse(stdin.readLineSync()) ?? -1;
  if (deleteId == -1) {
    print('Invalid Input for ID');
  }
  else {
       deleteId-=1;
    if (deleteId < toDoList.length) {
      var name = toDoList[deleteId];

      toDoList.removeAt(deleteId);
      print(deleteId.toString() + ': ' + name +' has been removed from the list.');
    }
    else {
      print("Provided Id missing or don't exist in List");
    }
  }
}

void editElement(List<String> toDOlist){

  var editID = int.tryParse(stdin.readLineSync()) ?? -1;
    if ( editID == -1) {
    print('Invalid Input For ID');
  }

    else{
      editID-=1;
      if (editID < toDOlist.length){
        var newName = stdin.readLineSync();
        var oldName  = toDOlist[editID];
        var Update = toDOlist[editID];
        toDOlist[editID] = newName;
//        var newInput= stdin.readLineSync();
        newName = (newName) ?? -1;

        print(oldName+ ' has been changed to ' +Update+ '.');
      }
      else{
        print("Provided Id missing or don't exist in List");
      }
    }




}