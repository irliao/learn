package com.linkedlist;

import com.linkedlist.LinkedList.Node;
class FindMiddleNode {

  static Node findMiddleNode(LinkedList linkedList) {
    int counter = 0;
    Node current = linkedList.head();
    Node result = current;

    while(current != null) {
      current = current.next();
      counter++;

      if (counter % 2 == 0) {
        result = result.next();
      }
    }

    if (counter % 2 == 1) {
      result = result.next();
    }

    return result;
  }

  public static void main(String... args) {
    LinkedList<Integer> l1 = new LinkedList<Integer>();
    l1.add(0);
    l1.add(1);
    l1.add(2);
    l1.add(3);
    l1.add(4);
    l1.printList();

  }
}
