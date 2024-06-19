module.exports = class Exercise {
    id = null;
    name = null;
    description = null;

    constructor(data) {
        this.id = data.exercise_id;
        this.name = data.exercise_name;
        this.description = data.exercise_description;
    }
}