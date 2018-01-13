package com.linkedlist;

class LinkedList<T> {
  class Node {
    T data;
    Node next;

    Node(T data) {
      this.data = data;
    }

    public Node next() {
      return this.next;
    }
  }

  private int size;
  private Node head;
  private Node tail;

  LinkedList() {
    this.head = null;
    this.tail = null;
  }

  /***
   * Add to the end of the list, if the list is empty then create the first element
   * @param data
   */
  void add(T data) {
    if (head == null) {
      head = new Node(data);
      tail = head;
      return;
    }

    tail.next = new Node(data);
    tail = tail.next;
  }

  void printList() {
    Node current = this.head;
    while (current != null) {
      System.out.println(current.data);
      current = current.next;
    }
  }

  public Node head() {
    return this.head;
  }

  public Node tail() {
    return this.tail;
  }

  public int size() {
    return this.size;
  }
}
