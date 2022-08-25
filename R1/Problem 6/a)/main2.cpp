#include "lista.h"
#include <iostream>

int main()
{
    Lista l;

    l=creare();
    tipar(l);
    addToEnd(l._prim, 30);
    tipar(l);
    addToEnd(l._prim, 15);
    tipar(l);
    addToEnd(l._prim, 30);
    tipar(l);
    Lista b;

    b=creare();
    tipar(b);
    PNod head = concatenate(l._prim, b._prim);
    Lista concatenatedList;
    concatenatedList._prim = head;
    tipar(concatenatedList);
}

