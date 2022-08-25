#include "lista.h"
#include <iostream>

using namespace std;


PNod creare_rec(){
  TElem x;
  cout<<"x=";
  cin>>x;
  if (x==0) {
      return nullptr;
  }
    else{
    PNod p=new Nod();
    p->e=x;
    p->urm=creare_rec();
    return p;
  }
}
//
//void initializeList(Lista& l){
//    l._prim = nullptr;
//}

PNod createNode(PNod head, TElem data){
    PNod newNode = new Nod();
    head = newNode;
    head->e = data;
    head->urm = nullptr;
    return head;
}

PNod concatenate(PNod a, PNod b){
    if(a == nullptr && b != nullptr){
        return b;
    }
    if(a != nullptr && b == nullptr){
        return a;
    }
    if(a == nullptr && b == nullptr){
        return nullptr;
    }
    if(a != nullptr && b != nullptr){
        addToEnd(a, b->e);
        b=b->urm;
        concatenate(a,b);
    }
    return a;
}

PNod addToEnd(PNod head, TElem data)
{
    if (head == nullptr) {

        return createNode(head, data);
    }
    else {
        head->urm = addToEnd(head->urm, data);
    }
    return head;
}

Lista creare(){
   Lista l;
   l._prim=creare_rec();
}

void tipar_rec(PNod p){
   if (p!=nullptr){
     cout<<p->e<<" ";
     tipar_rec(p->urm);
   }
}

void tipar(Lista l){
   tipar_rec(l._prim);
   cout<<"\n";
    cout<<"\n";
}

void distrug_rec(PNod p){
   if (p!=nullptr){
     distrug_rec(p->urm);
     delete p;
   }
}

void distrug(Lista l) {
	//se elibereaza memoria alocata nodurilor listei
    distrug_rec(l._prim);
}

