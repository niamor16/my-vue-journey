<template>
    <div>
        <input type="text" placeholder="nouvelle tache" v-model="newTask" />
        <button @click="addTask">Ajouter une tache</button>
    </div>

<div v-if="doneTasksCount > 0">
    <label for="hideDoneTasks">Cacher les {{ doneTasksCount }} tache(s) terminée(s)</label>
    <input type="checkbox" name="hideDoneTasks" v-model="hideDoneTasks" />
</div>

    <hr />

    <div v-if="tasks.length">
        <ul>
            <li v-for="task in getTasks" :key="task.date" :class="{completed: task.completed}">
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
import { computed, ref } from 'vue';

const tasks = ref([]);
const newTask = ref('');
const hideDoneTasks = ref(false);

const getTasks = computed(() => {   
    return tasks.value
        .filter((task) => hideDoneTasks.value ? !task.completed : true)
        .toSorted((a,b) => {
            if(!a.completed) return -1
            if(b.completed) return -1
            return a.date < b.date
        });
});

const addTask = () => {
    tasks.value.push({
        id: tasks.value.length,
        completed: false,
        title : newTask.value,
        date: Date.now()
    });
    newTask.value = '';
};

const doneTasksCount = computed(() => tasks.value.filter((t) => t.completed).length);

</script>

<style>
li.completed {
    text-decoration: line-through;
}
</style>