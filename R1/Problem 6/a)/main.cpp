
#include <bits/stdc++.h>
using namespace std;
struct Node {
    int elem;
    Node* next;
};

Node *newNode(int newElem)
{
    Node *newNode = new Node;
    newNode->elem = newElem;
    newNode->next = nullptr;
    return newNode;
}

Node* addToEnd(Node* head, int data)
{
    if (head == nullptr)
        return newNode(data);

    else
        head->next = addToEnd(head->next, data);
    return head;
}

void traverse(Node* head)
{
    if (head == nullptr)
        return;

    // If head is not NULL, print current node
    // and recur for remaining list
    cout << head->elem << " ";

    traverse(head->next);
}

//// Driver code
//int main()
//{
//    Node* head = nullptr;
//    head = addToEnd(head, 6);
//    head = addToEnd(head, 8);
//    head = addToEnd(head, 10);
//    head = addToEnd(head, 12);
//    head = addToEnd(head, 14);
//    traverse(head);
//}