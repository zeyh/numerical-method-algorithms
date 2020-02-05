import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
from sklearn.preprocessing import PolynomialFeatures
from sklearn import linear_model
from sympy import *
from scipy.optimize import curve_fit


# print(f)
# b = f[:,f.min(axis=0)>=0]

def rm_other(a):
    f = []
    for a1 in a:
        if a1[1] >0:
            f.append(a1)

    print(f)
    f = np.asarray(f)
    return f

def func(x, a, b):
  return a + b * x 

def get_trend(f,label,legend):
    x = f[:,0] #max time = 10
    y = f[:,1] #
    # print(y)
    popt, _ = curve_fit(func, x, y)
    print(popt)
    y_pred = [popt[0] + x1*(popt[1])   for x1 in x]
    y_pred = np.asarray(y_pred)
    plt.plot(x, y_pred, color=label, label=legend)
    plt.ylim(0, 1)
    plt.xlim(0, 5)
    plt.xlabel('Time (s)')
    plt.ylabel('Force (N)')
    # plt.legend(legend)
    plt.title("Friction Experiment 1")
    return x,y_pred

     
def save(f):
    np.savetxt("test1.csv", f, delimiter=",")

def scatter(f):   
    x = f[:,0] #max time = 10
    y = f[:,1] #
    plt.scatter(x, y, s=10)
    # plt.xlabel('time')
    # plt.ylabel('force')
    

def main():
    a = np.loadtxt("test1.txt") #SAND vertically
    b = np.loadtxt("test2.txt") #SAND horizontally
    c = np.loadtxt("test3.txt") #WOOD vertical
    d = np.loadtxt("test4.txt") #SAND horiozontal W/ WEIGHT
    a = rm_other(a)
    b = rm_other(b)
    c = rm_other(c)
    d = rm_other(d)
    x1,y1 = get_trend(a,"r","sand vertical")
    scatter(a)
    plt.legend(["trendline","individual result"])
    # x2,y2 = get_trend(b,"b","sand horizontal")
    # get_trend(c,"y","wood vertical")
    # get_trend(d,"g","sand horizontal w/ extra weight")
    # plt.legend(["sand vertical", "sand horizontal", "wood vertical","sand horizontal w/ extra weight"])
    # plt.legend(loc='best')
    #1 2
    #1 3
    #2 4


    plt.show()

main()

# print(np.amax(x))