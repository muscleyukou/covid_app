import 'package:covidapp/view/conponents/press_button.dart';
import 'package:covidapp/view/conponents/virus_list.dart';
import 'package:covidapp/viewmodel/virus_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class VirusData extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final viewModel=Provider.of<VirusViewModel>(context,listen: false);
    if(!viewModel.isLoading){
      Future(()=>viewModel.GetVirusData());
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[200],
        centerTitle: true,
        title: Text('コロナウイルス感染情報',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      floatingActionButton: PressButton(

        function:()=>onRefresh(context) ,
        icon: Icons.refresh,
      ),
      body:Container(
        color: Colors.orange[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<VirusViewModel>(builder:(context,model,child){
           if(model.isLoading){
             return Center(
               child: CircularProgressIndicator(
                   backgroundColor: Colors.deepOrange,
                   valueColor:AlwaysStoppedAnimation<Color>(Colors.white),
               ),
             );
           }else{
             return model.virus==null
               ?Container()
              : ListView.builder(
                 itemCount:model.virus.length,
                 itemBuilder: (context,int index){
                   final virusData =model.virus[index];
                   return  VirusList(data:virusData,);
                 },
            );

           }

          }),
        ),
      )
    );
  }

  onRefresh(BuildContext context) async{
    final viewModel=Provider.of<VirusViewModel>(context,listen: false);
    await viewModel.GetVirusData();
  }
}
