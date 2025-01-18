enum TodoPriority { low, medium, high}

TodoPriority mapToTodoPriority(String name)
{
  switch(name) 
  {
    case 'high': return TodoPriority.high;
    case 'medium' : return TodoPriority.medium;
    case 'low' : return TodoPriority.low;
    default: return TodoPriority.medium;
  }
}