import pandas as pd

#Reading the first CSV file
def read_income_csv():
    #The url of the file is local
    income_csv = pd.read_csv("C:/Users/Caetano/Downloads/income.data.csv")
    income_pd = pd.DataFrame(data=income_csv)
    #Sending to the other function who transform the data
    separate_income_csv(income_pd)
    
def separate_income_csv(income_pd):
    adjusted_income = []
    adjusted_happiness = []
    for i in income_pd.index:
        adjusted_income.append(round(income_pd['income'][i]))
        adjusted_happiness.append(round(income_pd['happiness'][i]))

    adjusted_data = pd.DataFrame(data=adjusted_income)
    adjusted_data.insert(1,"Happiness",adjusted_happiness)
    adjusted_data.insert(2,"Income",adjusted_income)
    adjusted_data = adjusted_data.drop(adjusted_data.columns[0], axis=1)

    adjusted_data.to_csv("Income_data.csv")

#Reading the second file 
def read_heart_csv():
    heart_csv = pd.read_csv("C:/Users/Caetano/Downloads/heart.data.csv")
    heart_pd = pd.DataFrame(data=heart_csv)
    separate_heart_csv(heart_pd)

def separate_heart_csv(heart_pd):
    adjusted_biking = []
    adjusted_smoking = []
    adjusted_disease = []
    for i in heart_pd.index:
        adjusted_biking.append(round(heart_pd['biking'][i]))
        adjusted_smoking.append(round(heart_pd['smoking'][i]))
        adjusted_disease.append(round(heart_pd['heart.disease'][i]))

    adjusted_data = pd.DataFrame(data=adjusted_biking)
    adjusted_data.insert(1,"Biking",adjusted_biking)
    adjusted_data.insert(2,"Smoking",adjusted_smoking)
    adjusted_data.insert(3,"Heart_Disease",adjusted_disease)
    adjusted_data = adjusted_data.drop(adjusted_data.columns[0],axis=1)

    adjusted_data.to_csv("Heart_data.csv")


#Calling the initials functions
read_income_csv()
read_heart_csv()    
    



    