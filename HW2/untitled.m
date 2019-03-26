% MECS 4510 Assignment 2
% Symbolic Regression 

clear all
clc

dataset = csvread('function1.csv');
x = dataset(:,1);
y = dataset(:,2);

function tree = store_tree()