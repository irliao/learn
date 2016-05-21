"use strict";
const restify = require("restify");
const NeDBDataStore = require("nedb");
const CardRepository_1 = require("./CardRepository");
const utils_1 = require("./utils");
let db = new NeDBDataStore({ filename: 'kanbanDb.json', autoload: true });
let cardRepository = new CardRepository_1.default(db);
let server = restify.createServer();
server.use(restify.CORS());
server.use(restify.bodyParser());
server.get('/cards', (req, res, next) => {
    cardRepository
        .findAll()
        .then(utils_1.sendResponse(res, next))
        .catch(utils_1.sendError);
});
server.post('/cards/:cardId/tasks', (req, res, next) => {
    let cardId = Number(req.params.cardId);
    let newTask = JSON.parse(req.body);
    cardRepository
        .addTask(cardId, newTask)
        .then(utils_1.sendResponse(res, next))
        .catch(utils_1.sendError);
});
server.del('/cards/:cardId/tasks/:taskId', (req, res, next) => {
    let cardId = Number(req.params.cardId);
    let taskId = Number(req.params.taskId);
    cardRepository
        .deleteTask(cardId, taskId)
        .then(utils_1.sendResponse(res, next))
        .catch(utils_1.sendError);
});
server.put('/cards/:cardId/tasks/:taskId', (req, res, next) => {
    let cardId = Number(req.params.cardId);
    let taskId = Number(req.params.taskId);
    let status = Boolean(JSON.parse(req.body).done);
    cardRepository
        .updateTaskStatus(cardId, taskId, status)
        .then(utils_1.sendResponse(res, next))
        .catch(utils_1.sendError);
});
server.put('/cards/:cardId', (req, res, next) => {
    let cardId = Number(req.params.cardId);
    let card = JSON.parse(req.body);
    cardRepository
        .updateCard(cardId, card)
        .then(utils_1.sendResponse(res, next))
        .catch(utils_1.sendError);
});
server.post('/cards', (req, res, next) => {
    let card = JSON.parse(req.body);
    cardRepository
        .addCard(card)
        .then(utils_1.sendResponse(res, next))
        .catch(utils_1.sendError);
});
server.listen(3000, () => {
    console.log(`${server.name} listening at ${server.url}`);
});
//# sourceMappingURL=server.js.map