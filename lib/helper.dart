String cuttitle (String string){
  if (string.length>20){
    return string.replaceRange(20, string.length ,"...");
  
  }
  else {
    return string;
  }
  
}