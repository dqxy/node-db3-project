const db = require("../data/db-config.js");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
};

// implementation details
function find() {
  return db("schemes");
}

// implement a method to find a user by id
function findById(id) {
  return db("schemes").where({ id }).first();
}

function findSteps(id) {
    return db('steps as s')
      .join('schemes as sc', 'sc.id', 's.scheme_id')
      .select('sc.scheme_name', 's.instructions', 's.step_number')
      .where('sc.id', id)
      .orderBy('s.step_number');
  }

function add(scheme_name) {
  return db("schemes")
    .insert(scheme_name, "id")
    .then(([id]) => {
      return findById(id);
    });
}

function update(id, changes) {
  return db("schemes")
    .where({ id })
    .update(changes)
    .then(() => {
      return findById(id);
    });
}

function remove(id) {
    return db("schemes").where({ id }).del();
  }
