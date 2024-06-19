module.exports = class Workout {
    id = null;
    userId = null;
    date = null;

    constructor(data) {
        this.id = data.workout_id;
        this.userId = data.usr_id;
        this.date = data.workout_date;
    }
}