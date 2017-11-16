'''
Created on Oct 19, 2010

@author: hliangzhao
'''
from numpy import *


# MATLAB中没有变长字符串矩阵,故采用Python的列表
def loadDataSet():
    postingList = [['my', 'dog', 'has', 'flea', 'problems', 'help', 'please'],
                  ['maybe', 'not', 'take', 'him', 'to', 'dog', 'park', 'stupid'],
                  ['my', 'dalmation', 'is', 'so', 'cute', 'I', 'love', 'him'],
                  ['stop', 'posting', 'stupid', 'worthless', 'garbage'],
                  ['mr', 'licks', 'ate', 'my', 'steak', 'how', 'to', 'stop', 'him'],
                  ['quit', 'buying', 'worthless', 'dog', 'food', 'stupid']]
    classVec = [0,1,0,1,0,1]    # 1 代表侮辱性言论
    return postingList, classVec


# 将所有文档中的不重叠单词添加到集合中
def createVocabList(dataSet):
    vocabSet = set([])
    for document in dataSet:
        vocabSet = vocabSet | set(document)  # 取并集
    return list(vocabSet)


# 输入词汇表和某篇文档，输出该文档对应的文档向量（单词存在则对应位置为1，否则为0）
def setOfWords2Vec(vocabList, inputSet):
    returnVec = [0]*len(vocabList)
    for word in inputSet:
        if word in vocabList:
            returnVec[vocabList.index(word)] = 1
        else: 
            print("the word: %s is not in my Vocabulary!" % word)
    return returnVec


# 朴素贝叶斯的分类器函数：计算p(ci), p(w|ci), p(w)
def trainNB0(trainMatrix, trainCategory):
    numTrainDocs = len(trainMatrix)
    numWords = len(trainMatrix[0])



















