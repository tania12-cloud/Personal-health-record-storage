module MyModule::PersonalHealthRecord {

    use aptos_framework::signer;
    use aptos_framework::vector;

    /// Struct representing a personal health record.
    struct HealthRecord has store, key {
        record_data: vector<u8>,  // The actual health data (e.g., encrypted)
        authorized_parties: vector<address>,  // List of authorized parties' addresses
    }

    /// Function to create a new health record.
    public fun create_record(owner: &signer, record_data: vector<u8>, authorized_parties: vector<address>) {
        let record = HealthRecord {
            record_data,
            authorized_parties,
        };
        move_to(owner, record);
    }
}
