#include <iostream>
#include <cstring>
using namespace std;

class Node {
  friend class LinkList;
  Node *m_pNext;
 public:
  Node(){ m_pNext = NULL; }
  virtual ~Node() {}
  void AppendNode(Node &n) {n.m_pNext = m_pNext; m_pNext = &n ;}
  virtual void Print() const = 0;
};

class IntNode : public Node {
  int m_i;
 public:
  IntNode(int i) {m_i = i;}
  virtual void Print() const {cout << m_i <<endl; }
};

class StrNode : public Node {
  char *m_s;
 public:
  StrNode(char *s) { m_s = new char[strlen(s) + 1]; strcpy(m_s,s);}
  ~StrNode() { delete[] m_s; }
  virtual void Print() const {cout << m_s <<endl; }
};

class LinkList{
  Node *m_pHead ;
  Node *m_pEnd ;
 public:
  LinkList(Node &n) {m_pHead = m_pEnd = &n; }
  ~LinkList() {
    Node* p = m_pHead;
    while (p) { m_pHead = p->m_pNext ; delete p ; p = m_pHead; }
  }
  void AppendNode( Node &n) {
    m_pEnd->AppendNode(n);
    m_pEnd = &n;
  }
  void PrintList() const {
    Node *p = m_pHead ;
    while (p){p->Print();p = p->m_pNext; }
  }
};

int main() {
  char word [80];
  cin >> word;
  LinkList llist(*new StrNode(word));
  int i;
  cin >> i ;
  llist.AppendNode(*new IntNode(i));
  llist.PrintList();
}
