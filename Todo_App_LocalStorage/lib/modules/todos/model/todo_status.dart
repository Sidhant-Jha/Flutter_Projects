class TodoStatus{
  const TodoStatus._();

  static bool? giveStatus(String? statusValue)
  {
    
    if(statusValue == null)
    {
      return null;
    }
    else if(statusValue.toLowerCase() == 'true')
    {
      return true;
    }
    else
      return false;
  }
}