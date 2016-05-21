"use strict";
class CardRepository {
    constructor(db) {
        this.db = db;
    }
    findAll() {
        return new Promise((resolve, reject) => {
            this.db.find({}, (err, docs) => {
                if (err) {
                    reject(err);
                }
                else {
                    resolve(docs);
                }
            });
        });
    }
    addTask(cardId, newTask) {
        return new Promise((resolve, reject) => {
            this.db.findOne({ id: cardId }, (err, doc) => {
                if (err) {
                    reject(err);
                }
                doc.tasks.push(newTask);
                this.updateTask(cardId, doc, newTask).then(resolve).catch(reject);
            });
        });
    }
    deleteTask(cardId, taskId) {
        return new Promise((resolve, reject) => {
            this.db.findOne({ id: cardId }, (err, doc) => {
                if (err) {
                    reject(err);
                }
                else {
                    let taskIndex = doc.tasks.findIndex((task) => task.id === taskId);
                    let removedTask = doc.tasks.splice(taskIndex, 1);
                    this.updateTask(cardId, doc, removedTask[0]);
                }
            });
        });
    }
    updateTaskStatus(cardId, taskId, status) {
        return new Promise((resolve, reject) => {
            this.db.findOne({ id: cardId }, (err, doc) => {
                if (err) {
                    reject(err);
                }
                else {
                    let currentTask = doc.tasks.find((task) => task.id === taskId);
                    currentTask.done = status;
                    this.updateTask(cardId, doc, currentTask);
                }
            });
        });
    }
    updateCard(cardId, card) {
        return new Promise((resolve, reject) => {
            this.db.update({ id: cardId }, card, {}, (err) => {
                if (err) {
                    reject(err);
                }
                else {
                    resolve(card);
                }
            });
        });
    }
    addCard(card) {
        return new Promise((resolve, reject) => {
            this.db.insert(card, (err, newDoc) => {
                if (err) {
                    reject(err);
                }
                else {
                    resolve(newDoc);
                }
            });
        });
    }
    updateTask(cardId, card, task) {
        return new Promise((resolve, reject) => {
            this.db.update({ id: cardId }, card, {}, (err) => {
                if (err) {
                    reject(err);
                }
                else {
                    resolve(task);
                }
            });
        });
    }
}
Object.defineProperty(exports, "__esModule", { value: true });
exports.default = CardRepository;
//# sourceMappingURL=CardRepository.js.map