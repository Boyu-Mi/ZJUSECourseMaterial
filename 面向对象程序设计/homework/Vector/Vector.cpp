#include "Vector.h"
template<class T>
Vector<T>::Vector() : m_pElements (nullptr), m_nCapacity(0), m_nSize(0){}

template<class T>
Vector<T>::Vector(int size) : m_nCapacity(size), m_nSize(0){
  if(size < 0){
    throw "std::illegal size";
  }else
    m_pElements = new T[size];
}

template<class T>
Vector<T>::Vector(const Vector& r) : m_nCapacity(r.m_nCapacity), m_nSize(r.m_nSize){
  m_pElements = new T[m_nCapacity];
  for(int i = 0; i < m_nSize; ++i){
    *(m_pElements + i) = *(r.m_pElements + i);
  }
}
template<class T>
Vector<T>::~Vector(){
  delete []m_pElements;
}
template<class T>
T& Vector<T>::operator[](int index){
    return *(m_pElements + index);
}

template<class T>
T& Vector<T>::at(int index){
  if(index < 0 || index >= m_nSize){
    throw "std::out of range";
  }else {
    return *(m_pElements + index);
  }
}

template<class T>
int Vector<T>::size() const {
  return m_nSize;
}

template<class T>
int Vector<T>::capacity() const {
  return m_nCapacity;
}

template<class T>
void Vector<T>::push_back(const T& x){
  if(m_nSize == m_nCapacity){
    //the vector is full.
    inflate();
  }
  m_pElements[m_nSize] = x;
  ++m_nSize;
}

template<class T>
void Vector<T>::clear() {
  m_nSize = 0;
  delete [] m_pElements;
  m_pElements = new T[m_nCapacity];
}

template<class T>
bool Vector<T>::empty() const {
  return m_nSize == 0;
}
template<class T>
void Vector<T>::inflate() {
  //if the capacity is 0, change it to 1, else double it.
  if(m_nCapacity == 0){
    m_nCapacity = 1;
    m_pElements = new T[m_nCapacity];
  }else{
    m_nCapacity *= 2;
    T* new_m_pElements = new T[m_nCapacity];
    for (int i = 0; i < m_nSize; ++i){
      *(new_m_pElements + i) = *(m_pElements + i);
    }
    delete [] m_pElements;
    m_pElements = new_m_pElements;
  }
}