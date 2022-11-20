# An implementation of the Ring Leader Election Algorithm for Distributed Systems

# Utility functions
def ping_successor(pid_successor):
    # Ping the successor to see if it is alive
    # If it is alive, return true
    # If it is dead, return false
    # Generate a random number between 0 and 1
    # If the number is less than 0.5, return true
    # If the number is greater than 0.5, return false
    if rand() < 0.5
        return true
    else
        return false
end

def ping_coordinator(pid_coordinator):
    # ASSUMPTION: All the processes know the coordinator initially hence no need to get_coordinator()
    # Ping the coordinator to see if it is alive
    # If it is alive, return true
    # If it is dead, return false
    # Generate a random number between 0 and 1
    # If the number is less than 0.5, return true
    # If the number is greater than 0.5, return false
    if rand() < 0.5
        return true
    else
        return false
end

def send_message(pid, message):
    # Send a message to the process with the given pid
    # Print the message
    print message
end

def get_message(pid, message):
    # Get a message from the process with the given pid
    # Return the message
    return message
end

def get_pid():
    # ASSUMPTION: The pid (process id) of the current process is 4
    # Get the pid of the current process
    # Return the pid
    return 4
end

def continue_working():
    print("Everything is fine. We continue with the work.")
end


# Algorithm functions
def get_successor():
    # ASSUMPTION: The successor is obtained by adding 1 to the current pid
    # Get the successor of the current process
    # Return the successor
    return get_pid() + 1 # Should return 5
end

def get_coordinator():
    # ASSUMPTION: The coordinator is, by default, the process with the highest pid - 10
    return 15
end


# Actual Algorithm
def ring_algo:
    # Ping coordinator in intervals of 1 second
    if ping_coordinator() == true
        # If the coordinator is alive, continue working
        continue_working()
    else
        # If the coordinator is dead, start the election
        # Ping the successor
        ping_successor(get_successor())
        if ping_successor(get_successor()) == true
            # If the successor is alive, send an ELECTION message
            send_message(get_successor(), "ELECTION")
        else
            # If the successor is dead, skip to the next process then send an ELECTION message
            send_message(get_successor() + 1, "ELECTION")
        end
    end

    # Receive election message
    # TODO: Start from here
    message = get_message()
    switch message
        case "ELECTION"


    # Send coordinator message
end
