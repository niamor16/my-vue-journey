<template>
    <div>
        <input type="text" placeholder="nouvelle tache" v-model="newTask" />
        <button @click="addTask">Ajouter une tache</button>
    </div>

<div>
    <label for="hideDoneTasks">Cacher les taches terminées</label>
    <input type="checkbox" name="hideDoneTasks" v-model="hideDoneTasks" />
</div>

    <hr />

    <div v-if="tasks.length">
        <ul>
            <li v-for="task in getTasks()" :key="task.date" :class="{completed: task.completed}">
                <input type="checkbox" v-model="task.completed"/>
                {{ task.title }}
            </li>
        </ul>
    </div>
    <div v-else>
        Aucune tache
    </div>
</template>

<script setup>
import { ref } from 'vue';

const tasks = ref([]);
const newTask = ref('');
const hideDoneTasks = ref(false);

const getTasks = () => {   
    return tasks.value
        .filter((task) => hideDoneTasks.value ? !task.completed : true)
        .sort((a,b) => {
            if(!a.completed) return -1
            if(b.completed) return -1
            return a.date < b.date
        });
};

const addTask = () => {
    tasks.value.push({
        id: tasks.value.length,
        completed: false,
        title : newTask.value,
        date: Date.now()
    });
    newTask.value = '';
};

</script>

<style>
li.completed {
    text-decoration: line-through;
}
</style>