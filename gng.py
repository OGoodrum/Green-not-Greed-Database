import psycopg2
import datetime

def query1():
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()
    cursor.execute("""select name from employee where salary >= 30000""")
    print('\nname')
    print('------------')
    for row in cursor.fetchall():
        print ("%s" % (row[0],))
    cursor.close()
    dbconn.close()

def query2():
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()
    cursor.execute("""select fund from donor join givesTo on donorId = donor""")
    print('\nfund ID')
    print('------------')
    for row in cursor.fetchall():
        print ("%s" % (row[0],))
    cursor.close()
    dbconn.close()

def query3():
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()
    cursor.execute("""select sum(amount) from fund""")
    print('\nsum')
    print('------------')
    for row in cursor.fetchall():
        print ("%s" % (row[0],))
    cursor.close()
    dbconn.close()

def query4():
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()
    cursor.execute("""select avg(amount) from (campaign join cost on campaignID = campaign) join fund on fund = fundId""")
    print('\naverage')
    print('------------')
    for row in cursor.fetchall():
        print ("%s" % (row[0],))
    cursor.close()
    dbconn.close()

def query5():
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()
    cursor.execute("""select date from fund where amount >= (select avg(amount) from fund)""")
    print('\ndate')
    print('------------')
    for row in cursor.fetchall():
        print ("%s" % (row[0],))
    cursor.close()
    dbconn.close()

def query6():
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()
    cursor.execute("""select location from event where date > any (select endDate from campaign)""")
    print('\nlocation')
    print('------------')
    for row in cursor.fetchall():
        print ("%s" % (row[0],))
    cursor.close()
    dbconn.close()

def query7():
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()
    cursor.execute("""select name from campaign where startDate < all (select date from event)""")
    print('\nname')
    print('------------')
    for row in cursor.fetchall():
        print ("%s" % (row[0],))
    cursor.close()
    dbconn.close()

def query8():
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()
    cursor.execute("""(select distinct name from volunteer join participates on volunteerId = volunteer) intersect (select name from volunteer where tier = 2)""")
    print('\nname')
    print('------------')
    for row in cursor.fetchall():
        print ("%s" % (row[0],))
    cursor.close()
    dbconn.close()

def query9():
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()
    cursor.execute("""select name, count(*) as event_count from volunteer join participates on volunteerId = volunteer group by name""")
    print('\nname | number of events')
    print('--------------------')
    for row in cursor.fetchall():
        print ("%s  %s" % (row[0], row[1]))
    cursor.close()
    dbconn.close()

def query_instructions(): #TODO add one more query #this function prints information about all the queries that the user can perform
    print('Query Menu')
    print('\nYou have ten queries to choose from:')
    print('Query 1:')
    print('   This query gets the names of all the employees who are paid more than 30 000 dollars.')
    print('Query 2:') 
    print('   This query finds the fund ID for all the donations made by donors.')
    print('Query 3:')
    print('   This query finds the sum of all the cash flows.')
    print('Query 4:')
    print('   This query finds the average cost of a campaign.')
    print('Query 5:')
    print ('   This query finds the date of when fund transfers with amounts greater than the average fund were completed.')
    print('Query 6:')
    print('   This query finds the locations of all events that occur after any campaign ends.')
    print('Query 7:')
    print('   This query finds the names of all the campaigns that occur before all events begin')
    print('Query 8:')
    print('   This query finds the volunteers who participate in an event and are tier 2.')
    print('Query 9:')
    print('   This query makes a list with names of all the volunteers and the number of events that they participate in')

def query():
    
    i = input('\nType the number of the query you want to perform or \'exit\' to return to the main menu or \'help\' to get the query options again:')
    if i == '1':
        query1()
        query()
    elif i == '2':
        query2()
        query()
    elif i == '3':
        query3()
        query()
    elif i == '4':
        query4()
        query()
    elif i == '5':
        query5()
        query()
    elif i == '6':
        query6()
        query()
    elif i == '7':
        query7()
        query()
    elif i == '8':
        query8()
        query()
    elif i == '9':
        query9()
        query()
    elif i == 'exit':
        main()
    elif i == 'help':
        query_instructions()
        query()
    else:
        print('Invalid input try again')
        query()

def insert_volunteer():
    volunteer = []
    i = input('Input the volunteer\'s name:')
    volunteer.append(i)
    
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()
    cursor.execute("insert into volunteer(name, tier) values (%s, 1)", [i])
    dbconn.commit()
    cursor.close()
    dbconn.close()

    print('Volunteer Insertion Succesful')


def insert_campaign():
    campaign = []
    name = input('\nInput the campaign\'s name:')
    campaign.append(name)

    start_date = input('Input the start date of the campaign (yyyy-mm-dd):')
    campaign.append(datetime.date(int(start_date[0:4]), int(start_date[5:7]), int(start_date[8:10])))

    end_date = input('Input the end date of the campaign (yyyy-mm-dd):')
    campaign.append(datetime.date(int(end_date[0:4]), int(end_date[5:7]), int(end_date[8:10])))

    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()
    cursor.execute("insert into campaign(name, startDate, endDate) values (%s, %s, %s)", campaign)
    dbconn.commit()
    cursor.close()
    dbconn.close()
    print('Campaign Insertion Succesful')

def insert_event():
    event = []

    campaignID = input('\nInput the campaignID of the campaign that the event is a part of:')
    event.append(int(campaignID))

    date = input('Input the date of the event (yyyy-mm-dd):')
    event.append(datetime.date(int(date[0:4]), int(date[5:7]), int(date[8:10])))

    location = input('Input the location of the event: ')
    event.append(location)

    start_time = input('Input the starting time of the event (hh:mm:ss):')
    event.append(datetime.time(int(start_time[0:2]), int(start_time[3:5]), int(start_time[6:8])))
    
    end_time = input('Input the ending time of the event (hh:mm:ss):')
    event.append(datetime.time(int(end_time[0:2]), int(end_time[3:5]), int(end_time[6:8])))

    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()

    cursor.execute("insert into event values (%s, %s, %s, %s, %s)", event)

    dbconn.commit()
    cursor.close()
    dbconn.close()

    print('Event Insertion Succesful')


    
def insert_instructions():
    print('Insert Menu\n')
    print('To add a new volunteer, type \'v\'')
    print('To add a new campaign, type \'c\'')
    print('To add a new event, type \'e\'')
    print('To get command options again, type \'help\'')
    print('To return to the main menu, type \'exit\'')


def insert_data():
    i = input('command:')
    if i == 'v':
        insert_volunteer()
        insert_data()
    elif i == 'c':
        insert_campaign()
        insert_data()
    elif i == 'e':
        insert_event()
        insert_data()
    elif i == 'help':
        insert_instructions()
        insert_data()
    elif i == 'exit':
        main()
    else:
        print("Invalid input try again")
        insert_data()

def all_funds_query():
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()

    cursor.execute("""select * from fund""")
    info = cursor.fetchall()

    cursor.close()
    dbconn.close()

    return info

def cost_funds_query():
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()

    cursor.execute("""select * from fund where amount < 0""")
    info = cursor.fetchall()

    cursor.close()
    dbconn.close()

    return info

def income_funds_query():
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()

    cursor.execute("""select * from fund where amount > 0""")
    info = cursor.fetchall()

    cursor.close()
    dbconn.close()

    return info

def donations_query():
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()

    cursor.execute("""select donorID, name, fundID, date, time, amount from donor join (fund join givesto on fundID = fund) on donorID = donor""")
    info = cursor.fetchall()

    cursor.close()
    dbconn.close()

    return info

def payroll_query():
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()

    cursor.execute("select employeeID, name, title, salary, fundId, date, time, amount from employee join (fund join paid on fundID = fund) on employeeID = employee")
    info = cursor.fetchall()

    cursor.close()
    dbconn.close()

    return info

def rent_payement_query():
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()

    cursor.execute("select address, rent, fundID, date, time, amount from office join (fund join RentPayement on fundID = fund) on address = office")
    info = cursor.fetchall()

    cursor.close()
    dbconn.close()

    return info

def campaign_costs_query():
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()

    cursor.execute("select campaignID, name, fundID, date, time, amount from campaign join (fund join cost on fundID = fund) on campaignID = campaign")
    info = cursor.fetchall()

    cursor.close()
    dbconn.close()

    return info

def campaign_funds_query():
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()

    cursor.execute("select campaignID, name, fundID, date, time, amount from campaign join (fund join fundraised on fundID = fund) on campaignID = campaign")
    info = cursor.fetchall()

    cursor.close()
    dbconn.close()

    return info

def output_table(data: str, info: list):
    if data == 'all' or data == 'c' or data == 'i':
        print('fundID    |   date   |   time   |  amount  ')
        print('------------------------------------------')
    elif data == 'd':
        print('donorID   |  name                                  |  fundID  |   date   |   time   |  amount  ')
        print('-----------------------------------------------------------------------------------------------')
    elif data == 'p':
        print('employeeID|  name                        |  title                       |  salary  |  fundID  |   date   |   time   |  amount  |')
        print('--------------------------------------------------------------------------------------------------------------------------------')
    elif data == 'r':
        print('  address                                         |   rent   |  fundID  |   date   |   time   |  amount  |')
        print('----------------------------------------------------------------------------------------------------------')
    elif data == 'cc' or data == 'cf':
        print('campaignID|  name                                            |  fundId  |   date   |   time   |  amount  |')
        print('----------------------------------------------------------------------------------------------------------')



    for row in info:
        for value in row:
            print(f'{value}'.ljust(10, ' '), end='')
            print('|', end='')
        print()

def output_graph(data: str, info: list):
    print('If the bar of the graph is a \'|\' then the amount is positive, if the bar of the graph is a \'-\' then the amount is negative.')
    
    fundid: int
    amount: int

    if data == 'all' or data == 'c' or data == 'i':
        fundid = 0
        amount = 3
    elif data == 'd' or data == 'r' or data == 'cf' or data == 'cc':
        fundid = 2
        amount = 5
    elif data == 'p':
        fundid = 4
        amount = 7

    print('fundID | amount')
    for row in info:
        if row[amount] > 0:                
             print(row[fundid], row[amount], int(row[amount] / 500) * '|')
        else:              
            print(row[fundid], row[amount], int((row[amount] * -1) / 500) * '-')



def accounting_instructions():
    print("Accounting Information Menu\n")
    print('The accounting information can ether be displayed in a table format or as a graph')
    print('   When prompted with \'format\', to get the data in a table, type \'table\'')
    print('   When prompted with \'format\', to get the data in a graph, type \'graph\'')
    print('There are many different pieces of data that you can see when looking at the accounting information')
    print('   When prompted with \'data\', to get all transactions, type \'all\'')
    print('   When prompted with \'data\', to get all costs, type \'c\'')
    print('   When prompted with \'data\', to get all incomes, type \'i\'')
    print('   When prompted with \'data\', to get all the donations, type \'d\'')
    print('   When prompted with \'data\', to get employee payroll, type \'p\'')
    print('   When prompted with \'data\', to get rent payements, type \'r\'')
    print('   When prompted with \'data\', to get campaign costs, type \'cc\'')
    print('   When prompted with \'data\', to get funds raised during campaigns, type \'cf\'')
    print('To see the instructions again, type \'help\' in either the \'format\' prompt or the \'data\' prompt.')
    print('To return to the main menu, type \'exit\' in either the \'format\' prompt or the \'data\' prompt.')


def accounting_information():
    format = input('format:')
    data = input('data:')
    info = []
    
    
    if data == 'all':
        info = all_funds_query()
    elif data == 'c':
        info = cost_funds_query()
    elif data == 'i':
        info = income_funds_query()
    elif data == 'd':
        info = donations_query()
    elif data == 'p':
        info = payroll_query()
    elif data == 'r':
        info = rent_payement_query()
    elif data == 'cc':
        info = campaign_costs_query()
    elif data == 'cf':
        info = campaign_funds_query()
    elif data == 'help':
        accounting_instructions()
        accounting_information()
        return
    elif data == 'exit':
        main()
        return
    else:
        print('Incorrect data input try again')
        accounting_information()
        return

    if format == 'table':
        output_table(data, info)
    elif format == 'graph':
        output_graph(data, info)
    elif format == 'help':
        accounting_instructions()
        accounting_information()
    elif format == 'exit':
        main()
    else:
        print('Incorrect format input try again')
        accounting_information()

def member_participation_count():
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()

    cursor.execute("""select name, count(*) as campaign_count from member join supports on memberId = member group by name""")

    print('\nname                                     | number of campaigns')
    print('----------------------------------------------------------------')
    for row in cursor.fetchall():
        print ("%s | %s" % (row[0], row[1]))
    
    cursor.close()
    dbconn.close()

def volunteer_participation_count():
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()

    cursor.execute("""select name, count(*) as event_count from volunteer join participates on volunteerId = volunteer group by name""")

    print('\nname | number of events')
    print('-------------------------')
    for row in cursor.fetchall():
        print ("%s | %s" % (row[0], row[1]))
    
    cursor.close()
    dbconn.close()

def member_participation_name():
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()

    cursor.execute("""select member.name, campaign.name from member join (campaign join supports on campaignID = campaign) on memberID = member""")

    print('\nname of member                           | name of event')
    print('------------------------------------------------------------')
    for row in cursor.fetchall():
        print ("%s | %s" % (row[0], row[1]))
    
    cursor.close()
    dbconn.close()

def volunteer_participation_name():
    dbconn = psycopg2.connect(host='studentdb.csc.uvic.ca', user='c370_s166', password='nC7xDYKw')
    cursor = dbconn.cursor()

    cursor.execute("""select volunteer.name, campaign.name from volunteer join (participates join (event join campaign on event.campaignId = campaign.campaignId) on participates.campaignId = event.campaignId) on volunteer.volunteerId = volunteer""")

    print('\nname of volunteer | name of campaign')
    print('--------------------------------------')
    for row in cursor.fetchall():
        print ("%s | %s" % (row[0], row[1]))
    
    cursor.close()
    dbconn.close()

def membership_history_instructions():
    print('Member History Menu\n')
    print('To get the number of campaigns that a member participates in, type \'mpc\'')
    print('To get the names of campaigns that members participate in, type \'mpn')
    print('To get the number of events that a volunteer participates in, type \'vpc\'')
    print('To get the names of the campaigns that a volunteer participates in type \'vpn\'')
    print('To get the member history instructions again type \'help\'')
    print('To return to the main menu, type \'exit\'')
    

def membership_history():
    
    command = input('command:')

    if command == 'mpc':
        member_participation_count()
        membership_history()
    elif command == 'vpc':
        volunteer_participation_count()
        membership_history()
    elif command == 'mpn':
        member_participation_name()
        membership_history()
    elif command == 'vpn':
        volunteer_participation_name()
        membership_history()
    elif command == 'help':
        membership_history_instructions()
        membership_history()
    elif command == 'exit':
        main()
    else:
        print('Invalid input try again')
        membership_history()


def main():
    print('You are at the main menu for Green-not-Greed :)\n')

    i = input('For queries, type \'q\'\nFor inputing data, type \'i\'\nFor accounting information, type \'a\'\nFor membership history, type \'m\'\nTo leave, type \'exit\'\n')

    if i == 'q':
        query_instructions()
        query()
    elif i == 'i':
        insert_instructions()
        insert_data()
    elif i == 'a':
        accounting_instructions()
        accounting_information()
    elif i == 'm':
        membership_history_instructions()
        membership_history()
    elif i == 'exit':
        return
    else:
        print('Invalid input try again\n')
        main()


if __name__ == '__main__':
    main()