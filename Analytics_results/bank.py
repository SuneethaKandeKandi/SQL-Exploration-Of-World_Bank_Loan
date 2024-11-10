#!/usr/bin/env python
# coding: utf-8

# In[3]:


import pandas as pd
df = pd.read_csv(r"C:\Users\Ramya\Downloads\Worldbank sql\data_worldbank.csv")


# In[5]:


df


# In[15]:


get_ipython().system('pip install pandasql')



# In[7]:


duplicates = df.duplicated().sum()


# In[9]:


df


# In[11]:


df.drop_duplicates(inplace=True)


# In[17]:


null_values = df.isnull().sum()
null_values_df = pd.DataFrame(null_values, columns=['Missing Values'])
null_values_df = null_values_df[null_values_df['Missing Values'] > 0]


# In[23]:


df.dropna(subset = ['Board Approval Date', 'Effective Date (Most Recent)'],inplace = True)


# In[25]:


df.drop(["Country Code", "Borrower's Obligation (US$)"], axis=1, inplace=True)
df.rename(columns = { 'Original Principal Amount (US$)' : 'Original Principal Amount',
             'Undisbursed Amount (US$)' : 'Undisbursed Amount',
             'Disbursed Amount (US$)' : 'Disbursed Amount',
             'Repaid to IDA (US$)' : 'Repaid to IDA',
             'Due to IDA (US$)' : 'Due to IDA',
          'Cancelled Amount (US$)' : 'Cancelled Amount',
          'Effective Date (Most Recent)' : 'Effective Date'},inplace = True)


# In[51]:


date_columns = ['Board Approval Date', 'Effective Date', 'End of Period']
date_format = '%m/%d/%Y %I:%M:%S %p'

for column in date_columns:
    df[column] = pd.to_datetime(df[column], format=date_format)


# In[53]:


df.to_csv('cleaned_dataset.csv', index=False)

