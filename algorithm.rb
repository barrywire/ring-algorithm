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
    # create an array to hold the pids
    # add the pid to the array
    print message
    pid_array = []
    pid_array.append(pid)

    return pid_array
end

def get_message(pid, message):
    # Get a message from the process with the given pid
    # Return the message
    return message, pid_array
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
    ping_coordinator(get_coordinator())
    if ping_coordinator() == true
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

    # Receive messages
    message = get_message()

    case message
    when "ELECTION"
        # This means that the message has come back to the initiator
        # Read the pid_array to see if there is a pid greater than the current pid
        # If there is, send a COORDINATOR message to that pid calling it the new coordinator
        # If there is not, send a COORDINATOR message to the current pid calling it the new coordinator
        if pid_array > get_pid()
            send_message(pid_array, "COORDINATOR")
        else
            send_message(get_pid(), "COORDINATOR")
        end
    when "COORDINATOR"
        # This means the initiator is the new coordinator
        # Send a message to the entire ring to inform them of the new coordinator
        # Send a message also to inform them of the new ring members
        # Continue working
        send_message(pid_array, "COORDINATOR, #{get_pid()}")
        send_message(pid_array, "NEW RING, #{pid_array}")
        continue_working()
    end

end
